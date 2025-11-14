const Phong = require('../models/phong');
const pool = require('../database/client');

class RoomService {
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
                    lp.TenLoaiPhong,
                    lp.Gia AS GiaLoaiPhong
                FROM phong p
                JOIN loaiphong lp ON p.MaLoaiPhong = lp.MaLoaiPhong
            `;

            if (cond) {
                query += ` ${cond}`;
            }

            if (!/order by/i.test(cond || '')) {
                query += ' ORDER BY p.MaPhong DESC';
            }

            const [result] = await pool.execute(query, params);
            return result.map((row) => {
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

                room.TenLoaiPhong = row.TenLoaiPhong;
                room.Gia = row.GiaPhong ?? row.GiaLoaiPhong ?? null;
                return room;
            });
        } catch (err) {
            console.error(err);
            return [];
        }
    };

    findById = async (id) => {
        const rooms = await this.getAll('WHERE p.MaPhong = ?', [id]);
        return rooms.length ? rooms[0] : null;
    };

    create = async (data) => {
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
            data.Gia ?? null,
            data.MoTa ?? null,
            data.HinhAnh ?? null,
            data.MaThietBi ?? null,
        ];

        const [result] = await pool.execute(query, params);
        return result.insertId;
    };
}

module.exports = RoomService;
