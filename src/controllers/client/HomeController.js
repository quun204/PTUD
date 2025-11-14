const CategoryRoomService = require('../../services/CategoryRoomService');
const RoomService = require('../../services/RoomService');

class HomeController {
    static index = async (req, res) => {
        const message = req.session.message;
        delete req.session.message;

        try {
            const categoryRoomService = new CategoryRoomService();
            const roomService = new RoomService();

            const roomTypes = await categoryRoomService.getAll();
            const rooms = await roomService.getAll();

            res.render('client/home/index', { message, roomTypes, rooms });
        } catch (error) {
            console.error('Error fetching data:', error);
            res.status(500).send('Internal Server Error');
        }
    };

    static login_view = (req, res) => {
        const message = req.session.message;
        delete req.session.message;
        res.render('client/auth/login', { message });
    };

    static register_view = (req, res) => {
        const message = req.session.message;
        delete req.session.message;
        res.render('client/auth/register', { message });
    };
}

module.exports = HomeController;
