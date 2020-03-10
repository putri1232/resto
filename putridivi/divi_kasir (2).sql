-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10 Mar 2020 pada 02.56
-- Versi Server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `divi_kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_order`
--

CREATE TABLE IF NOT EXISTS `detail_order` (
`id_detail_order` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_masakan` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `status_detail_order` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE IF NOT EXISTS `level` (
`id_level` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masakan`
--

CREATE TABLE IF NOT EXISTS `masakan` (
`id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(11) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `status_masakan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE IF NOT EXISTS `order` (
`id_order` int(11) NOT NULL,
  `no_meja` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `status_order` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
`id_transaksi` int(11) NOT NULL,
  `id_user` int(255) NOT NULL,
  `id_order` int(50) NOT NULL,
  `tanggal` date NOT NULL,
  `total_bayar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `id_lever` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_order`
--
ALTER TABLE `detail_order`
 ADD PRIMARY KEY (`id_detail_order`), ADD UNIQUE KEY `id_masakan_2` (`id_masakan`), ADD KEY `id_masakan` (`id_masakan`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
 ADD PRIMARY KEY (`id_level`), ADD UNIQUE KEY `id_level` (`id_level`);

--
-- Indexes for table `masakan`
--
ALTER TABLE `masakan`
 ADD PRIMARY KEY (`id_masakan`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
 ADD PRIMARY KEY (`id_order`), ADD UNIQUE KEY `id_user` (`id_user`), ADD KEY `keterangan` (`keterangan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
 ADD PRIMARY KEY (`id_transaksi`), ADD UNIQUE KEY `id_user` (`id_user`), ADD UNIQUE KEY `id_order` (`id_order`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`), ADD KEY `id_lever` (`id_lever`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_order`
--
ALTER TABLE `detail_order`
MODIFY `id_detail_order` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `masakan`
--
ALTER TABLE `masakan`
MODIFY `id_masakan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_order`
--
ALTER TABLE `detail_order`
ADD CONSTRAINT `detail_order_ibfk_1` FOREIGN KEY (`id_detail_order`) REFERENCES `order` (`id_order`);

--
-- Ketidakleluasaan untuk tabel `masakan`
--
ALTER TABLE `masakan`
ADD CONSTRAINT `masakan_ibfk_1` FOREIGN KEY (`id_masakan`) REFERENCES `detail_order` (`id_masakan`);

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `transaksi` (`id_order`),
ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `transaksi` (`id_user`),
ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_lever`) REFERENCES `level` (`id_level`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
