CREATE TABLE `DOKTER` (
  `id_dokter` int PRIMARY KEY,
  `nama` varchar(30),
  `sp` varchar(20),
  `no_tlpn` int,
  `kode_poli` int
);

CREATE TABLE `POLIKLINIK` (
  `kode_poli` int PRIMARY KEY,
  `nama_poli` varchar(20)
);

CREATE TABLE `PASIEN` (
  `NIK` int PRIMARY KEY,
  `nama_pasien` varchar(30),
  `alamat` varchar(50),
  `tgl_lahir` date
);

CREATE TABLE `DAFTAR` (
  `no_antrean` int PRIMARY KEY,
  `tgl_daftar` date,
  `NIK` int,
  `id_dokter` int
);

CREATE TABLE `REKAM_MEDIS` (
  `no_rm` int PRIMARY KEY,
  `no_antrean` int,
  `diagnosis` text,
  `keluhan` text
);

CREATE TABLE `OBAT` (
  `kode_obat` int PRIMARY KEY,
  `nama_obat` varchar(50),
  `harga` int
);

CREATE TABLE `RESEP` (
  `no_resep` int PRIMARY KEY,
  `tgl` date,
  `kode_obat` int,
  `no_rm` int
);

CREATE TABLE `KAMAR` (
  `no_kamar` int PRIMARY KEY,
  `tipe_kamar` varchar(30)
);

CREATE TABLE `RAWAT_INAP` (
  `tgl_masuk` date,
  `tgl_keluar` date,
  `NIK` int,
  `no_kamar` int
);

ALTER TABLE `DOKTER` ADD FOREIGN KEY (`kode_poli`) REFERENCES `POLIKLINIK` (`kode_poli`);

ALTER TABLE `DAFTAR` ADD FOREIGN KEY (`id_dokter`) REFERENCES `DOKTER` (`id_dokter`);

ALTER TABLE `DAFTAR` ADD FOREIGN KEY (`NIK`) REFERENCES `PASIEN` (`NIK`);

ALTER TABLE `REKAM_MEDIS` ADD FOREIGN KEY (`no_antrean`) REFERENCES `DAFTAR` (`no_antrean`);

ALTER TABLE `REKAM_MEDIS` ADD FOREIGN KEY (`no_rm`) REFERENCES `RESEP` (`no_rm`);

ALTER TABLE `OBAT` ADD FOREIGN KEY (`kode_obat`) REFERENCES `RESEP` (`kode_obat`);

ALTER TABLE `RAWAT_INAP` ADD FOREIGN KEY (`NIK`) REFERENCES `PASIEN` (`NIK`);

ALTER TABLE `RAWAT_INAP` ADD FOREIGN KEY (`no_kamar`) REFERENCES `KAMAR` (`no_kamar`);
