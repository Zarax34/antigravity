const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { PrismaClient } = require('@prisma/client');

const router = express.Router();
const prisma = new PrismaClient();

const JWT_SECRET = process.env.JWT_SECRET || 'quran_center_secret_key_2024';

// Login
router.post('/login', async (req, res) => {
    try {
        const { username, password } = req.body;

        if (!username || !password) {
            return res.status(400).json({
                success: false,
                message: 'يرجى إدخال اسم المستخدم وكلمة المرور',
            });
        }

        const user = await prisma.user.findUnique({
            where: { username },
            include: { center: true, halqa: true },
        });

        if (!user) {
            return res.status(401).json({
                success: false,
                message: 'اسم المستخدم أو كلمة المرور غير صحيحة',
            });
        }

        if (user.isBlocked) {
            return res.status(403).json({
                success: false,
                message: 'تم حظر هذا الحساب',
            });
        }

        const isValidPassword = await bcrypt.compare(password, user.passwordHash);

        if (!isValidPassword) {
            return res.status(401).json({
                success: false,
                message: 'اسم المستخدم أو كلمة المرور غير صحيحة',
            });
        }

        const token = jwt.sign(
            { userId: user.id, role: user.role },
            JWT_SECRET,
            { expiresIn: '30d' }
        );

        const { passwordHash, ...userData } = user;

        res.json({
            success: true,
            message: 'تم تسجيل الدخول بنجاح',
            data: {
                token,
                user: userData,
            },
        });
    } catch (error) {
        console.error('Login error:', error);
        res.status(500).json({
            success: false,
            message: 'حدث خطأ في الخادم',
        });
    }
});

// Register (for creating new users - admin only)
router.post('/register', async (req, res) => {
    try {
        const { username, password, fullName, role, email, phone, centerId, halqaId } = req.body;

        if (!username || !password || !fullName || !role) {
            return res.status(400).json({
                success: false,
                message: 'يرجى إدخال جميع الحقول المطلوبة',
            });
        }

        const existingUser = await prisma.user.findUnique({
            where: { username },
        });

        if (existingUser) {
            return res.status(409).json({
                success: false,
                message: 'اسم المستخدم موجود بالفعل',
            });
        }

        const passwordHash = await bcrypt.hash(password, 12);

        const user = await prisma.user.create({
            data: {
                username,
                passwordHash,
                fullName,
                role,
                email,
                phone,
                centerId,
                halqaId,
            },
        });

        const { passwordHash: _, ...userData } = user;

        res.status(201).json({
            success: true,
            message: 'تم إنشاء الحساب بنجاح',
            data: userData,
        });
    } catch (error) {
        console.error('Register error:', error);
        res.status(500).json({
            success: false,
            message: 'حدث خطأ في الخادم',
        });
    }
});

// Get current user
router.get('/me', async (req, res) => {
    try {
        const token = req.headers.authorization?.replace('Bearer ', '');

        if (!token) {
            return res.status(401).json({
                success: false,
                message: 'يرجى تسجيل الدخول',
            });
        }

        const decoded = jwt.verify(token, JWT_SECRET);
        const user = await prisma.user.findUnique({
            where: { id: decoded.userId },
            include: { center: true, halqa: true },
        });

        if (!user) {
            return res.status(404).json({
                success: false,
                message: 'المستخدم غير موجود',
            });
        }

        const { passwordHash, ...userData } = user;

        res.json({
            success: true,
            data: userData,
        });
    } catch (error) {
        console.error('Get me error:', error);
        res.status(401).json({
            success: false,
            message: 'جلسة غير صالحة',
        });
    }
});

// Change password
router.post('/change-password', async (req, res) => {
    try {
        const token = req.headers.authorization?.replace('Bearer ', '');
        const { currentPassword, newPassword } = req.body;

        if (!token) {
            return res.status(401).json({
                success: false,
                message: 'يرجى تسجيل الدخول',
            });
        }

        const decoded = jwt.verify(token, JWT_SECRET);
        const user = await prisma.user.findUnique({
            where: { id: decoded.userId },
        });

        if (!user) {
            return res.status(404).json({
                success: false,
                message: 'المستخدم غير موجود',
            });
        }

        const isValidPassword = await bcrypt.compare(currentPassword, user.passwordHash);

        if (!isValidPassword) {
            return res.status(400).json({
                success: false,
                message: 'كلمة المرور الحالية غير صحيحة',
            });
        }

        const newPasswordHash = await bcrypt.hash(newPassword, 12);

        await prisma.user.update({
            where: { id: user.id },
            data: { passwordHash: newPasswordHash },
        });

        res.json({
            success: true,
            message: 'تم تغيير كلمة المرور بنجاح',
        });
    } catch (error) {
        console.error('Change password error:', error);
        res.status(500).json({
            success: false,
            message: 'حدث خطأ في الخادم',
        });
    }
});

// Update FCM token
router.post('/fcm-token', async (req, res) => {
    try {
        const token = req.headers.authorization?.replace('Bearer ', '');
        const { fcmToken } = req.body;

        if (!token) {
            return res.status(401).json({
                success: false,
                message: 'يرجى تسجيل الدخول',
            });
        }

        const decoded = jwt.verify(token, JWT_SECRET);

        await prisma.user.update({
            where: { id: decoded.userId },
            data: { fcmToken },
        });

        res.json({
            success: true,
            message: 'تم تحديث رمز الإشعارات',
        });
    } catch (error) {
        console.error('FCM token error:', error);
        res.status(500).json({
            success: false,
            message: 'حدث خطأ في الخادم',
        });
    }
});

module.exports = router;
