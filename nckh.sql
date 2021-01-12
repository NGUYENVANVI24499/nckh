-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 08, 2021 lúc 03:17 AM
-- Phiên bản máy phục vụ: 10.4.16-MariaDB
-- Phiên bản PHP: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nckh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diemdanh`
--

CREATE TABLE `diemdanh` (
  `id` int(11) NOT NULL,
  `id_lichcongtac` int(11) NOT NULL,
  `id_giangvien` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `node` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `diemdanh`
--

INSERT INTO `diemdanh` (`id`, `id_lichcongtac`, `id_giangvien`, `status`, `node`, `created_at`, `update_at`) VALUES
(93, 1, 1, 1, '', '2021-01-05 11:09:04', '2021-01-05 11:10:08'),
(94, 1, 2, 1, '', '2021-01-05 11:09:04', '2021-01-05 11:10:08'),
(95, 1, 3, 1, '', '2021-01-05 11:09:04', '2021-01-05 11:10:08'),
(96, 1, 4, 1, '', '2021-01-05 11:09:04', '2021-01-05 11:10:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `id_gvien` int(11) NOT NULL,
  `name_gv` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`id_gvien`, `name_gv`) VALUES
(1, 'ThS. Bùi Thanh Khiết'),
(2, 'TS. Bùi Thanh Hùng'),
(3, 'TS. Hoàng Mạnh Hà'),
(4, 'ThS. Nguyễn Thị Thủy'),
(5, 'ThS. Trần Văn Tài');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lich_congtac`
--

CREATE TABLE `lich_congtac` (
  `id_lichcongtac` int(11) NOT NULL,
  `id_tuan` int(11) NOT NULL,
  `id_loaicongtac` int(11) NOT NULL,
  `thoigian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay` date NOT NULL,
  `ngay_ketthuc` date NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `diadiem` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lich_congtac`
--

INSERT INTO `lich_congtac` (`id_lichcongtac`, `id_tuan`, `id_loaicongtac`, `thoigian`, `ngay`, `ngay_ketthuc`, `noidung`, `diadiem`, `created_at`, `update_at`) VALUES
(1, 1, 1, '07 giờ 15', '2021-01-05', '2021-01-08', 'Lớp bồi dưỡng kiến thức quốc phòng và an ninh cho đối tượng 3, khóa 54 năm 2020', '	\r\nBan Chỉ huy quân sự thành phố Thủ Dầu Một (Đường ĐX80, Khu phố 5, phường Định Hòa, Tp.TDM)', '2021-01-05 02:28:49', NULL),
(2, 1, 1, '09 giờ 00', '2021-01-05', '2021-01-06', 'Tập huấn phương pháp định tính và định lượng\r\n\r\n', 'Ban Chỉ huy quân sự thành phố Thủ Dầu Một (Đường ĐX80, Khu phố 5, phường Định Hòa, Tp.TDM)', '2021-01-05 08:35:28', NULL),
(3, 1, 1, '09 giờ 00', '2020-11-02', '2020-12-22', 'Chương trình đào tạo \"Nâng cao năng lực hỗ trợ, xây dựng và phát triển dự án khởi nghiệp đổi mới sáng tạo\"\r\n\r\nChương trình đào tạo \"Nâng cao năng lực hỗ trợ, xây dựng và phát triển dự án khởi nghiệp đổi mới sáng tạo\"\r\n\r\n', 'adsgasdf', '2020-12-28 14:54:31', NULL),
(4, 1, 1, '09 giờ 00', '2020-11-09', '2020-12-15', '	\r\nLãnh đạo Trường dự tập huấn sử dụng phân hệ ứng dụng di động của Phần mềm Quản lý văn bản', 'Phòng khách 1\r\n\r\n', '2020-12-28 14:53:11', NULL),
(5, 1, 1, '09 giờ 00', '2020-12-15', '2020-12-22', 'Phòng Đảm bảo chất lượng\r\n\r\ntổ chức chuyên gia tập huấn\r\n\r\ntự đánh giá chương trình đào tạo theo tiêu chuẩn AUN-QA', 'Phòng A4.102', '2020-12-28 14:53:46', NULL),
(6, 5, 1, '12 h 20', '2020-12-16', '2020-12-22', 'Coi thi: Hệ thống thông tin địa lý', 'Phòng C2.202-P6', '2020-12-28 14:53:57', NULL),
(7, 7, 2, '10 giờ 30', '2020-12-28', '2020-12-28', 'công tác đoàn', 'b2', '2020-12-29 00:54:23', NULL),
(8, 7, 3, '1h00', '2020-12-29', '2020-12-29', 'abc', 'b2', '2020-12-29 01:35:04', NULL),
(9, 8, 3, '12', '2020-12-29', '2020-12-30', 'công tác', 'b2', '2020-12-29 02:32:44', NULL),
(10, 8, 2, '12 h 20', '2021-01-05', '2021-01-07', 'yyyy', 'b2', '2021-01-05 08:36:27', NULL),
(11, 7, 2, '12 h 20', '2021-01-13', '2021-01-27', 'av', 'va', '2021-01-05 11:10:39', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaicongtac`
--

CREATE TABLE `loaicongtac` (
  `id_loaicongtac` int(11) NOT NULL,
  `name_congtac` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaicongtac`
--

INSERT INTO `loaicongtac` (`id_loaicongtac`, `name_congtac`) VALUES
(1, 'Công tác đào tạo'),
(2, 'Công tác nghiên cứu khoa học'),
(3, 'Công tác Đảng, Đoàn thể và phục vụ cộng đồng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhphan`
--

CREATE TABLE `thanhphan` (
  `id_t` int(11) NOT NULL,
  `id_thanhphan` int(11) NOT NULL,
  `id_gvien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhphan`
--

INSERT INTO `thanhphan` (`id_t`, `id_thanhphan`, `id_gvien`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 4),
(7, 3, 2),
(8, 3, 4),
(9, 4, 1),
(10, 4, 5),
(11, 5, 2),
(12, 5, 5),
(13, 6, 2),
(14, 6, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tuan`
--

CREATE TABLE `tuan` (
  `id_tuan` int(11) NOT NULL,
  `name_tuan` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tuan`
--

INSERT INTO `tuan` (`id_tuan`, `name_tuan`) VALUES
(1, 'LỊCH CÔNG TÁC TUẦN 1'),
(2, 'LỊCH CÔNG TÁC TUẦN 2'),
(3, 'LỊCH CÔNG TÁC TUẦN 3'),
(4, 'LỊCH CÔNG TÁC TUẦN 4'),
(5, 'LỊCH CÔNG TÁC TUẦN 5'),
(6, 'LỊCH CÔNG TÁC TUẦN 6'),
(7, 'LỊCH CÔNG TÁC TUẦN 7'),
(8, 'LỊCH CÔNG TÁC TUẦN 8');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `diemdanh`
--
ALTER TABLE `diemdanh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_giangvien` (`id_giangvien`),
  ADD KEY `id_lichcongtac` (`id_lichcongtac`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`id_gvien`);

--
-- Chỉ mục cho bảng `lich_congtac`
--
ALTER TABLE `lich_congtac`
  ADD PRIMARY KEY (`id_lichcongtac`),
  ADD KEY `id_tuan` (`id_tuan`),
  ADD KEY `id_loaicongtac` (`id_loaicongtac`);

--
-- Chỉ mục cho bảng `loaicongtac`
--
ALTER TABLE `loaicongtac`
  ADD PRIMARY KEY (`id_loaicongtac`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `thanhphan`
--
ALTER TABLE `thanhphan`
  ADD PRIMARY KEY (`id_t`),
  ADD KEY `id_gvien` (`id_gvien`),
  ADD KEY `id_thanhphan` (`id_thanhphan`);

--
-- Chỉ mục cho bảng `tuan`
--
ALTER TABLE `tuan`
  ADD PRIMARY KEY (`id_tuan`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `diemdanh`
--
ALTER TABLE `diemdanh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  MODIFY `id_gvien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `lich_congtac`
--
ALTER TABLE `lich_congtac`
  MODIFY `id_lichcongtac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `loaicongtac`
--
ALTER TABLE `loaicongtac`
  MODIFY `id_loaicongtac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `thanhphan`
--
ALTER TABLE `thanhphan`
  MODIFY `id_t` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tuan`
--
ALTER TABLE `tuan`
  MODIFY `id_tuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `diemdanh`
--
ALTER TABLE `diemdanh`
  ADD CONSTRAINT `diemdanh_ibfk_1` FOREIGN KEY (`id_giangvien`) REFERENCES `giangvien` (`id_gvien`),
  ADD CONSTRAINT `diemdanh_ibfk_2` FOREIGN KEY (`id_lichcongtac`) REFERENCES `lich_congtac` (`id_lichcongtac`);

--
-- Các ràng buộc cho bảng `lich_congtac`
--
ALTER TABLE `lich_congtac`
  ADD CONSTRAINT `lich_congtac_ibfk_1` FOREIGN KEY (`id_tuan`) REFERENCES `tuan` (`id_tuan`),
  ADD CONSTRAINT `lich_congtac_ibfk_2` FOREIGN KEY (`id_loaicongtac`) REFERENCES `loaicongtac` (`id_loaicongtac`);

--
-- Các ràng buộc cho bảng `thanhphan`
--
ALTER TABLE `thanhphan`
  ADD CONSTRAINT `thanhphan_ibfk_1` FOREIGN KEY (`id_gvien`) REFERENCES `giangvien` (`id_gvien`),
  ADD CONSTRAINT `thanhphan_ibfk_2` FOREIGN KEY (`id_thanhphan`) REFERENCES `lich_congtac` (`id_lichcongtac`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
