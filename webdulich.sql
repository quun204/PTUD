-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 14, 2025 lúc 07:36 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webdulich`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chiphi`
--

CREATE TABLE `chiphi` (
  `MaChiPhi` int(11) NOT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `CPNhanSu` float DEFAULT NULL,
  `CPVanHanh` float DEFAULT NULL,
  `CPBaoTri` float DEFAULT NULL,
  `DOANHTHUMaDoanhThu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdatphong`
--

CREATE TABLE `chitietdatphong` (
  `MaChiTietDatPhong` int(11) NOT NULL,
  `MaNguoiDung` int(11) NOT NULL,
  `MaPhong` int(11) NOT NULL,
  `NgayNhanPhong` datetime DEFAULT NULL,
  `NgayTraPhong` datetime DEFAULT NULL,
  `SoLuongKhach` int(11) DEFAULT NULL,
  `SoLuongPhong` int(11) DEFAULT NULL,
  `TrangThai` varchar(255) DEFAULT NULL,
  `MaKhuyenMai` varchar(255) DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  `LichSu` varchar(255) DEFAULT NULL,
  `DanhGia` varchar(255) DEFAULT NULL,
  `PHONGMaPhong` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdichvu`
--

CREATE TABLE `chitietdichvu` (
  `MaChiTietDichVu` int(11) NOT NULL,
  `MaDichVu` varchar(255) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaThanhTien` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MaChiTietHoaDon` int(11) NOT NULL,
  `MaHoaDon` varchar(255) NOT NULL,
  `MaThietBi` varchar(255) DEFAULT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `GiaThanhTien` float DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dichvu`
--

CREATE TABLE `dichvu` (
  `MaDichVu` int(11) NOT NULL,
  `TenDichVu` varchar(255) DEFAULT NULL,
  `TenNhaCungCap` varchar(255) DEFAULT NULL,
  `Gia` float DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `CHITIETDICHVUMaChiTietDichVu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doanhthu`
--

CREATE TABLE `doanhthu` (
  `MaDoanhThu` int(11) NOT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `DoanhThuTuPhong` float DEFAULT NULL,
  `DoanhThuTuDichVu` float DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `TenDoanhThu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaodich`
--

CREATE TABLE `giaodich` (
  `MaGiaoDich` int(11) NOT NULL,
  `MaNguoiDung` varchar(255) DEFAULT NULL,
  `MaPhong` int(11) DEFAULT NULL,
  `NgayThanhToan` datetime DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  `CHITIETDICHVUMaChiTietDichVu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaodich_dichvu`
--

CREATE TABLE `giaodich_dichvu` (
  `MaGiaoDich` int(11) NOT NULL,
  `MaDichVu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHoaDon` int(11) NOT NULL,
  `MaNguoiDung` int(11) NOT NULL,
  `NgayLapHoaDon` datetime DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `NGUOIDUNGMaNguoiDung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon_doanhthu`
--

CREATE TABLE `hoadon_doanhthu` (
  `MaHoaDon` int(11) NOT NULL,
  `MaDoanhThu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaiphong`
--

CREATE TABLE `loaiphong` (
  `MaLoaiPhong` int(11) NOT NULL,
  `DienTich` float DEFAULT NULL,
  `SoKhachToiDa` int(11) DEFAULT NULL,
  `TenLoaiPhong` varchar(255) DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaiphong`
--

INSERT INTO `loaiphong` (`MaLoaiPhong`, `DienTich`, `SoKhachToiDa`, `TenLoaiPhong`, `MoTa`) VALUES
(1, 25.5, 2, 'Phòng Standard', 'Phòng tiêu chuẩn 2 người, view thành phố'),
(2, 45, 4, 'Phòng VIP', 'Phòng VIP cao cấp, view biển, có bồn tắm'),
(3, 30, 3, 'Phòng Deluxe', 'Phòng 3 người, có ban công');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MaNguoiDung` int(11) NOT NULL,
  `HoTen` varchar(255) DEFAULT NULL,
  `NgaySinh` datetime DEFAULT NULL,
  `CCCD` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `ThongTinLienHe` varchar(255) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `SDT` varchar(255) DEFAULT NULL,
  `QuocTich` varchar(255) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Discriminator` varchar(255) DEFAULT NULL,
  `CHITIETHOADONMaChiTietHoaDon` int(11) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 là ngừng hoạt động , 1 là hoạt động'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`MaNguoiDung`, `HoTen`, `NgaySinh`, `CCCD`, `Username`, `Password`, `ThongTinLienHe`, `DiaChi`, `SDT`, `QuocTich`, `Rating`, `Discriminator`, `CHITIETHOADONMaChiTietHoaDon`, `Email`, `status`) VALUES
(1, 'Trịnh Nguyen', NULL, NULL, 'saulgoodman', '$2b$10$XWA6t3KeGfVYxMjvsXyYzOfWGTY7Z0T4G4FGN/RnpnDyjqN3dwg7O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hoan49803@gmail.com', 1),
(2, 'Nguyễn Đức Quân', NULL, NULL, 'quan204', '$2y$10$jonYz9JmUTy5F0xb841yGudwSXRGnPzsSgjUOGS8l12XHojjodA3m', NULL, NULL, NULL, NULL, NULL, 'user', NULL, 'nguyenducquan221204@gmail.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung_thongbao`
--

CREATE TABLE `nguoidung_thongbao` (
  `MaNguoiDung` int(11) NOT NULL,
  `MaTHongBao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong`
--

CREATE TABLE `phong` (
  `MaPhong` int(11) NOT NULL,
  `SoPhong` varchar(255) DEFAULT NULL,
  `ViTriTang` int(11) DEFAULT NULL,
  `TrangThaiPhong` varchar(255) DEFAULT NULL,
  `MaLoaiPhong` int(11) NOT NULL,
  `View` varchar(255) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `gia` varchar(255) NOT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `MaThietBi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phong`
--

INSERT INTO `phong` (`MaPhong`, `SoPhong`, `ViTriTang`, `TrangThaiPhong`, `MaLoaiPhong`, `View`, `DiaChi`, `Rating`, `gia`, `MoTa`, `HinhAnh`, `MaThietBi`) VALUES
(6, '12', 12, 'Trống', 2, 'view sông', '12', 1222, '', '12sds', 'z6778430735297_46347017a32b5157f68ed392a4e1b2ff.jpg', 1),
(7, '12', 12, 'Trống', 2, 'view sông', '12', 89, '121212', '121212', 'p103.jpg', 1212),
(8, 'h123', 12, 'Trống', 2, 'view sông', 'abc', 8, '120', 'hehee', 'p103.jpg', 1),
(9, 'h123', 12, 'Trống', 1, 'view sông', '12', 2, '12', '12', 'p103.jpg', 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong_thietbi`
--

CREATE TABLE `phong_thietbi` (
  `MaPhong` int(11) NOT NULL,
  `MaThietBi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thietbi`
--

CREATE TABLE `thietbi` (
  `MaThietBi` int(11) NOT NULL,
  `TenThietBi` varchar(255) DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thietbi`
--

INSERT INTO `thietbi` (`MaThietBi`, `TenThietBi`, `MoTa`) VALUES
(101, 'Smart TV 50 inch', 'TV thông minh, kết nối Wifi'),
(102, 'Điều hòa 2 chiều', 'Điều hòa Inverter tiết kiệm điện'),
(103, 'Tủ lạnh mini', 'Tủ lạnh 90L, không đóng tuyết'),
(104, 'Bồn tắm Jacuzzi', 'Bồn tắm sục massage');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao`
--

CREATE TABLE `thongbao` (
  `MaTHongBao` int(11) NOT NULL,
  `TieuDe` varchar(255) DEFAULT NULL,
  `NoiDung` varchar(255) DEFAULT NULL,
  `DoiTuong` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaitro`
--

CREATE TABLE `vaitro` (
  `MaVaiTro` int(11) NOT NULL,
  `TenVaiTro` varchar(255) DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vaitro`
--

INSERT INTO `vaitro` (`MaVaiTro`, `TenVaiTro`, `MoTa`) VALUES
(1, 'admin', 'admin'),
(2, 'nhà cung cấp', 'nhà cung cấp');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chiphi`
--
ALTER TABLE `chiphi`
  ADD PRIMARY KEY (`MaChiPhi`),
  ADD KEY `FKCHIPHI487543` (`DOANHTHUMaDoanhThu`);

--
-- Chỉ mục cho bảng `chitietdatphong`
--
ALTER TABLE `chitietdatphong`
  ADD PRIMARY KEY (`MaChiTietDatPhong`),
  ADD KEY `FKCHITIETDAT390667` (`MaNguoiDung`),
  ADD KEY `FKCHITIETDAT516346` (`MaPhong`);

--
-- Chỉ mục cho bảng `chitietdichvu`
--
ALTER TABLE `chitietdichvu`
  ADD PRIMARY KEY (`MaChiTietDichVu`);

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`MaChiTietHoaDon`);

--
-- Chỉ mục cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  ADD PRIMARY KEY (`MaDichVu`);

--
-- Chỉ mục cho bảng `doanhthu`
--
ALTER TABLE `doanhthu`
  ADD PRIMARY KEY (`MaDoanhThu`);

--
-- Chỉ mục cho bảng `giaodich`
--
ALTER TABLE `giaodich`
  ADD PRIMARY KEY (`MaGiaoDich`),
  ADD KEY `FKGIAODICH529793` (`CHITIETDICHVUMaChiTietDichVu`),
  ADD KEY `MaPhong` (`MaPhong`);

--
-- Chỉ mục cho bảng `giaodich_dichvu`
--
ALTER TABLE `giaodich_dichvu`
  ADD PRIMARY KEY (`MaGiaoDich`,`MaDichVu`),
  ADD KEY `FKGIAODICH_D516834` (`MaDichVu`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHoaDon`),
  ADD KEY `FKHOADON343865` (`MaNguoiDung`);

--
-- Chỉ mục cho bảng `hoadon_doanhthu`
--
ALTER TABLE `hoadon_doanhthu`
  ADD PRIMARY KEY (`MaHoaDon`,`MaDoanhThu`),
  ADD KEY `FKHOADON_DOA394634` (`MaDoanhThu`);

--
-- Chỉ mục cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  ADD PRIMARY KEY (`MaLoaiPhong`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MaNguoiDung`),
  ADD KEY `FKNGUOIDUNG393429` (`CHITIETHOADONMaChiTietHoaDon`);

--
-- Chỉ mục cho bảng `nguoidung_thongbao`
--
ALTER TABLE `nguoidung_thongbao`
  ADD PRIMARY KEY (`MaNguoiDung`,`MaTHongBao`),
  ADD KEY `FKNGUOIDUNG_52985` (`MaTHongBao`);

--
-- Chỉ mục cho bảng `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`MaPhong`),
  ADD KEY `FKPHONG320639` (`MaLoaiPhong`);

--
-- Chỉ mục cho bảng `phong_thietbi`
--
ALTER TABLE `phong_thietbi`
  ADD PRIMARY KEY (`MaPhong`,`MaThietBi`),
  ADD KEY `FKPHONG_THIE772934` (`MaThietBi`);

--
-- Chỉ mục cho bảng `thietbi`
--
ALTER TABLE `thietbi`
  ADD PRIMARY KEY (`MaThietBi`);

--
-- Chỉ mục cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  ADD PRIMARY KEY (`MaTHongBao`);

--
-- Chỉ mục cho bảng `vaitro`
--
ALTER TABLE `vaitro`
  ADD PRIMARY KEY (`MaVaiTro`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chiphi`
--
ALTER TABLE `chiphi`
  MODIFY `MaChiPhi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chitietdatphong`
--
ALTER TABLE `chitietdatphong`
  MODIFY `MaChiTietDatPhong` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chitietdichvu`
--
ALTER TABLE `chitietdichvu`
  MODIFY `MaChiTietDichVu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `MaChiTietHoaDon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  MODIFY `MaDichVu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `doanhthu`
--
ALTER TABLE `doanhthu`
  MODIFY `MaDoanhThu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giaodich`
--
ALTER TABLE `giaodich`
  MODIFY `MaGiaoDich` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giaodich_dichvu`
--
ALTER TABLE `giaodich_dichvu`
  MODIFY `MaGiaoDich` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHoaDon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hoadon_doanhthu`
--
ALTER TABLE `hoadon_doanhthu`
  MODIFY `MaHoaDon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  MODIFY `MaLoaiPhong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MaNguoiDung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nguoidung_thongbao`
--
ALTER TABLE `nguoidung_thongbao`
  MODIFY `MaNguoiDung` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phong`
--
ALTER TABLE `phong`
  MODIFY `MaPhong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `phong_thietbi`
--
ALTER TABLE `phong_thietbi`
  MODIFY `MaPhong` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thietbi`
--
ALTER TABLE `thietbi`
  MODIFY `MaThietBi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  MODIFY `MaTHongBao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vaitro`
--
ALTER TABLE `vaitro`
  MODIFY `MaVaiTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chiphi`
--
ALTER TABLE `chiphi`
  ADD CONSTRAINT `FKCHIPHI487543` FOREIGN KEY (`DOANHTHUMaDoanhThu`) REFERENCES `doanhthu` (`MaDoanhThu`);

--
-- Các ràng buộc cho bảng `chitietdatphong`
--
ALTER TABLE `chitietdatphong`
  ADD CONSTRAINT `FKCHITIETDAT390667` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`),
  ADD CONSTRAINT `FKCHITIETDAT516346` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`);

--
-- Các ràng buộc cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  ADD CONSTRAINT `FKDICHVU831017` FOREIGN KEY (`MaDichVu`) REFERENCES `chitietdichvu` (`MaChiTietDichVu`);

--
-- Các ràng buộc cho bảng `giaodich`
--
ALTER TABLE `giaodich`
  ADD CONSTRAINT `FKGIAODICH529793` FOREIGN KEY (`CHITIETDICHVUMaChiTietDichVu`) REFERENCES `chitietdichvu` (`MaChiTietDichVu`),
  ADD CONSTRAINT `giaodich123` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`);

--
-- Các ràng buộc cho bảng `giaodich_dichvu`
--
ALTER TABLE `giaodich_dichvu`
  ADD CONSTRAINT `FKGIAODICH_D216881` FOREIGN KEY (`MaGiaoDich`) REFERENCES `giaodich` (`MaGiaoDich`),
  ADD CONSTRAINT `FKGIAODICH_D516834` FOREIGN KEY (`MaDichVu`) REFERENCES `dichvu` (`MaDichVu`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `FKHOADON343865` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`),
  ADD CONSTRAINT `FKHOADON748297` FOREIGN KEY (`MaHoaDon`) REFERENCES `chitiethoadon` (`MaChiTietHoaDon`);

--
-- Các ràng buộc cho bảng `hoadon_doanhthu`
--
ALTER TABLE `hoadon_doanhthu`
  ADD CONSTRAINT `FKHOADON_DOA394634` FOREIGN KEY (`MaDoanhThu`) REFERENCES `doanhthu` (`MaDoanhThu`),
  ADD CONSTRAINT `FKHOADON_DOA779962` FOREIGN KEY (`MaHoaDon`) REFERENCES `hoadon` (`MaHoaDon`);

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `FKNGUOIDUNG393429` FOREIGN KEY (`CHITIETHOADONMaChiTietHoaDon`) REFERENCES `chitiethoadon` (`MaChiTietHoaDon`);

--
-- Các ràng buộc cho bảng `nguoidung_thongbao`
--
ALTER TABLE `nguoidung_thongbao`
  ADD CONSTRAINT `FKNGUOIDUNG_353213` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`),
  ADD CONSTRAINT `FKNGUOIDUNG_52985` FOREIGN KEY (`MaTHongBao`) REFERENCES `thongbao` (`MaTHongBao`);

--
-- Các ràng buộc cho bảng `phong`
--
ALTER TABLE `phong`
  ADD CONSTRAINT `FKPHONG320639` FOREIGN KEY (`MaLoaiPhong`) REFERENCES `loaiphong` (`MaLoaiPhong`);

--
-- Các ràng buộc cho bảng `phong_thietbi`
--
ALTER TABLE `phong_thietbi`
  ADD CONSTRAINT `FKPHONG_THIE56502` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`),
  ADD CONSTRAINT `FKPHONG_THIE772934` FOREIGN KEY (`MaThietBi`) REFERENCES `thietbi` (`MaThietBi`);

--
-- Các ràng buộc cho bảng `vaitro`
--
ALTER TABLE `vaitro`
  ADD CONSTRAINT `FKVAITRO401853` FOREIGN KEY (`MaVaiTro`) REFERENCES `nguoidung` (`MaNguoiDung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
