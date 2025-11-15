// src/services/RoomService.js

const Phong = require('../models/phong');
const pool = require('../database/client');

class RoomService {
    /**
     * Lấy danh sách phòng (kèm thông tin loại phòng)
     * @param {string} cond  - điều kiện bổ sung cho câu query (VD: 'WHERE p.MaPhong = ?')
     * @param {Array} params - mảng tham số truyền cho câu query (VD: [id])
     * @returns {Promise<Phong[]>}
     */
    getAll = async (cond = '', params = []) => {
        try {
            let query = `
                SELECT
                    p.MaPhong,
                    p.SoPhong,
                    p.ViTriTang,
                    p.TrangThaiPhong,
                    p.MaLoaiPhong,
                    p.View,
                    p.DiaChi,
                    p.Rating,
                    p.MoTa,
                    p.HinhAnh,
                    p.MaThietBi,
                    p.gia AS GiaPhong,
                    lp.TenLoaiPhong
                FROM phong p
                JOIN loaiphong lp ON p.MaLoaiPhong = lp.MaLoaiPhong
            `;

            // nối điều kiện nếu có
            if (cond) {
                query += ` ${cond}`;
            }

            // nếu cond không có ORDER BY thì tự thêm
            if (!/order by/i.test(cond || '')) {
                query += ' ORDER BY p.MaPhong DESC';
            }

            const [rows] = await pool.execute(query, params);

            // map từng dòng DB sang object Phong
            return rows.map((row) => {
                const room = new Phong(
                    row.MaPhong,
                    row.SoPhong,
                    row.ViTriTang,
                    row.TrangThaiPhong,
                    row.MaLoaiPhong,
                    row.View,
                    row.DiaChi,
                    row.Rating,
                    row.MoTa,
                    row.HinhAnh,
                    row.MaThietBi
                );

                // các thuộc tính bổ sung không nằm trong constructor
                room.TenLoaiPhong = row.TenLoaiPhong;
                room.Gia = row.GiaPhong ?? null; // lấy giá từ bảng phong.gia

                return room;
            });
        } catch (err) {
            console.error('RoomService.getAll error:', err);
            return [];
        }
    };

    /**
     * Tìm phòng theo MaPhong
     * @param {number} id
     * @returns {Promise<Phong|null>}
     */
    findById = async (id) => {
        const rooms = await this.getAll('WHERE p.MaPhong = ?', [id]);
        return rooms.length ? rooms[0] : null;
    };

    /**
     * Tạo phòng mới
     * @param {Object} data - dữ liệu phòng
     * @returns {Promise<number>} - ID phòng vừa tạo
     */
    create = async (data) => {
        try {
            const query = `
                INSERT INTO phong
                    (SoPhong, ViTriTang, TrangThaiPhong, MaLoaiPhong, View, DiaChi, Rating, gia, MoTa, HinhAnh, MaThietBi)
                VALUES
                    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `;

            const params = [
                data.SoPhong,
                data.ViTriTang ?? null,
                data.TrangThaiPhong ?? 'Trống',
                data.MaLoaiPhong,
                data.View ?? null,
                data.DiaChi ?? null,
                data.Rating ?? null,
                data.Gia ?? null,          // map đúng với cột gia trong bảng phong
                data.MoTa ?? null,
                data.HinhAnh ?? null,
                data.MaThietBi ?? null,
            ];

            const [result] = await pool.execute(query, params);
            return result.insertId;
        } catch (err) {
            console.error('RoomService.create error:', err);
            throw err;
        }
    };
}

module.exports = RoomService;
