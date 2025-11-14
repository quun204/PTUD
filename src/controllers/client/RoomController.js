const fs = require('fs');
const path = require('path');
const CategoryRoomService = require('../../services/CategoryRoomService');
const RoomService = require('../../services/RoomService');

class RoomController {
    static createView = async (req, res) => {
        const message = req.session.message;
        delete req.session.message;

        try {
            const categoryRoomService = new CategoryRoomService();
            const roomTypes = await categoryRoomService.getAll();

            res.render('client/home/add-room', { message, roomTypes });
        } catch (error) {
            console.error('Error loading add room form:', error);
            res.status(500).send('Internal Server Error');
        }
    };

    static store = async (req, res) => {
        const roomService = new RoomService();
        const {
            SoPhong,
            ViTriTang,
            TrangThaiPhong,
            MaLoaiPhong,
            View,
            DiaChi,
            Rating,
            Gia,
            MoTa,
            MaThietBi,
        } = req.body;

        let redirectPath = '/';

        try {
            if (!SoPhong || !MaLoaiPhong || !Gia) {
                throw new Error('Vui lòng nhập đầy đủ Số phòng, Loại phòng và Giá.');
            }

            const parsedLoaiPhong = Number(MaLoaiPhong);
            const parsedGia = Number(Gia);
            const parsedTang = ViTriTang ? Number(ViTriTang) : null;
            const parsedRating = Rating ? Number(Rating) : null;
            const parsedThietBi = MaThietBi ? Number(MaThietBi) : null;

            if (!Number.isInteger(parsedLoaiPhong) || parsedLoaiPhong <= 0) {
                throw new Error('Loại phòng không hợp lệ.');
            }

            if (!Number.isFinite(parsedGia) || parsedGia <= 0) {
                throw new Error('Giá phòng phải là số lớn hơn 0.');
            }

            if (parsedTang !== null && (!Number.isInteger(parsedTang) || parsedTang < 0)) {
                throw new Error('Vị trí tầng phải là số nguyên không âm.');
            }

            if (parsedRating !== null && (parsedRating < 0 || parsedRating > 5)) {
                throw new Error('Đánh giá phải nằm trong khoảng từ 0 đến 5.');
            }

            if (parsedThietBi !== null && (!Number.isInteger(parsedThietBi) || parsedThietBi < 0)) {
                throw new Error('Mã thiết bị phải là số nguyên không âm.');
            }

            const imagePath = req.file ? `/uploads/${req.file.filename}` : null;

            await roomService.create({
                SoPhong,
                ViTriTang: parsedTang,
                TrangThaiPhong,
                MaLoaiPhong: parsedLoaiPhong,
                View,
                DiaChi,
                Rating: parsedRating,
                Gia: parsedGia,
                MoTa,
                HinhAnh: imagePath,
                MaThietBi: parsedThietBi,
            });

            req.session.message = {
                mess: 'Thêm phòng thành công.',
                type: 'success',
            };
        } catch (error) {
            console.error('Error saving room:', error);

            if (req.file) {
                const filePath = path.join(__dirname, '..', '..', '..', 'public', 'uploads', req.file.filename);
                fs.unlink(filePath, (unlinkError) => {
                    if (unlinkError) {
                        console.error('Error removing uploaded file:', unlinkError);
                    }
                });
            }

            req.session.message = {
                mess: error.message || 'Không thể thêm phòng. Vui lòng thử lại sau.',
                type: 'danger',
            };
            redirectPath = '/rooms/add';
        }

        req.session.save(() => {
            res.redirect(redirectPath);
        });
    };
}

module.exports = RoomController;
