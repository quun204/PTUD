const express = require('express');
const path = require('path');
const fs = require('fs');
const multer = require('multer');
const router = express.Router();
const HomeController = require('../controllers/client/HomeController');
const AuthController = require('../controllers/client/AuthController');
const RoomController = require('../controllers/client/RoomController');

const uploadDir = path.join(__dirname, '..', '..', 'public', 'uploads');
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
}

const storage = multer.diskStorage({
    destination: (_req, _file, cb) => {
        cb(null, uploadDir);
    },
    filename: (_req, file, cb) => {
        const uniqueSuffix = `${Date.now()}-${Math.round(Math.random() * 1e9)}`;
        const ext = path.extname(file.originalname) || '.jpg';
        cb(null, `${uniqueSuffix}${ext}`);
    },
});

const fileFilter = (_req, file, cb) => {
    if (/^image\//i.test(file.mimetype)) {
        cb(null, true);
    } else {
        cb(new Error('Chỉ hỗ trợ tải lên tập tin hình ảnh.'));
    }
};

const upload = multer({ storage, fileFilter });

const uploadRoomImage = (req, res, next) => {
    upload.single('HinhAnh')(req, res, (err) => {
        if (!err) {
            return next();
        }

        console.error('Upload image error:', err);
        req.session.message = {
            mess: err.message || 'Tập tin tải lên không hợp lệ.',
            type: 'danger',
        };

        req.session.save(() => {
            res.redirect('/rooms/add');
        });
    });
};

router.get('/', HomeController.index);
router.get('/login.html', HomeController.login_view);
router.get('/register.html', HomeController.register_view);
router.get('/xac-thuc.html', AuthController.setActiveAccount);

router.get('/rooms/add', RoomController.createView);
router.post('/rooms', uploadRoomImage, RoomController.store);

router.post('/register', AuthController.register);
router.post('/login', AuthController.login);
router.get('/logout.html', AuthController.logout);

module.exports = router;
