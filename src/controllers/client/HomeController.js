

const CategoryRoomService = require('../../services/CategoryRoomService');
const RoomService = require('../../services/RoomService');

class HomeController {
    static index = async (req, res) => {
        const message = req.session.message;
        delete req.session.message;

        try {
            const categoryRoomService = new CategoryRoomService();
            const roomService = new RoomService();

            // Lấy toàn bộ loại phòng
            const roomTypes = await categoryRoomService.getAll();

            // Lấy toàn bộ phòng
            const rooms = await roomService.getAll();
            console.log(rooms);

            res.render('client/home/index', { message: message, roomTypes: roomTypes, rooms: rooms });
        } catch (error) {
            console.error('Error fetching data:', error);
            res.status(500).send('Internal Server Error');
        }
    }

    static login_view = (req, res) => {
        const message = req.session.message;
        delete req.session.message;
        res.render('client/auth/login', { message: message })
    }

    static register_view = (req, res) => {
        const message = req.session.message;
        delete req.session.message;
        res.render('client/auth/register', { message: message })
    }
}


module.exports = HomeController
