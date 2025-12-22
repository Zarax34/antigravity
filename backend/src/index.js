const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

// Import routes
const authRoutes = require('./routes/auth');
const centerRoutes = require('./routes/centers');
const halqaRoutes = require('./routes/halqat');
const studentRoutes = require('./routes/students');
const reportRoutes = require('./routes/reports');
const courseRoutes = require('./routes/courses');
const activityRoutes = require('./routes/activities');
const feeRoutes = require('./routes/fees');
const holidayRoutes = require('./routes/holidays');
const announcementRoutes = require('./routes/announcements');
const userRoutes = require('./routes/users');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// API Routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/centers', centerRoutes);
app.use('/api/v1/halqat', halqaRoutes);
app.use('/api/v1/students', studentRoutes);
app.use('/api/v1/reports', reportRoutes);
app.use('/api/v1/courses', courseRoutes);
app.use('/api/v1/activities', activityRoutes);
app.use('/api/v1/fees', feeRoutes);
app.use('/api/v1/holidays', holidayRoutes);
app.use('/api/v1/announcements', announcementRoutes);
app.use('/api/v1/users', userRoutes);

// Health check
app.get('/health', (req, res) => {
    res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({
        success: false,
        message: 'حدث خطأ في الخادم',
        error: process.env.NODE_ENV === 'development' ? err.message : undefined,
    });
});

// 404 handler
app.use((req, res) => {
    res.status(404).json({
        success: false,
        message: 'المسار غير موجود',
    });
});

// Start server
app.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
    console.log(`📖 Quran Center API v1.0.0`);
});

module.exports = app;
