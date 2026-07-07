-- Nama   : maulana algi fari
-- NIM	  : 24241109
-- Kelas  : C
-- Modul  : 2

-- Aktivitas di Modul 2
-- 1. Membuat database dan menggunakannya
-- 2. Membuat table
-- 3. Mengisi Tabel (data)

-- Proses Data Definition Language (DDL)

-- Objek Database: bersifat hirarkis/leveling 
-- Level 1 - Kolom - berisi data
-- Level 2 - Tabel - berisi kolom-kolom
-- Level 3 - Database - berisi tabel-tabel

-- Aktivitas 1 - Membuat database dan menggunakannya
-- membuat database CREATE DATABASE [nama_database];
-- Praktek #1 - Membuat database
CREATE DATABASE kelas_c_mart;

-- Praktek #2 - Menggunakan database
-- sintak USE [nama_database];
USE kelas_c_mart;

-- Aktivitas 2 - Membuat tabel dalam database
-- sintaknya : CREATE TABLE(nama_kolom [tipe_data] [constraint], ...);
CREATE TABLE pelanggan(
kode_pelanggan varchar(20) PRIMARY KEY,
no_urut INT NOT NULL,
nama_pelanggan varchar(30) NOT NULL,
alamat varchar(50)
);

-- Aktivitas 3 - Mengisi tabel
-- sintaks : 
-- INSERT INTO nama_tabel(kolom1, kolom2, ...)
-- VALUES(values1, values2, ...);
-- Praktek #3 - Mengisi tabel per baris
INSERT INTO pelanggan(kode_pelanggan, no_urut, nama_pelanggan)
VALUES("dqlabcust00",	0,	"Pelanggan Non Member");

-- cek data sudah masuk
SELECT * FROM pelanggan;

-- Praktek #4 - Mengisi tabel banyak baris dalam satu perintah
INSERT INTO pelanggan(kode_pelanggan, no_urut, nama_pelanggan, alamat)
VALUES("dqlabcust01",	1,	"Eva Novianti, S.H.",	"Vila Sempilan, No. 67 - Kota B"),
("dqlabcust02",	2,	"Heidi Goh",	"Vila Sempilan, No. 11 - Kota B"),
("dqlabcust03",	3,	"Unang Handoko",	"Vila Sempilan, No. 1 - Kota B");


-- 1. Buat database (opsional)
CREATE DATABASE IF NOT EXISTS dqlab_db;
USE dqlab_db;

-- 2. Buat tabel ms_produk_dqlab
CREATE TABLE ms_produk_dqlab (
    kode_produk VARCHAR(10) PRIMARY KEY,
    no_urut INT NOT NULL,
    kategori_produk VARCHAR(50) NOT NULL,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(15,2) NOT NULL
);

-- 3. Insert data dari file CSV
INSERT INTO ms_produk_dqlab (kode_produk, no_urut, kategori_produk, nama_produk, harga) VALUES
('prod-01', 1, 'Alat Tulis Kantor', 'Kotak Pensil DQLab', 62500.00),
('prod-02', 2, 'Aksesoris Komputer', 'Flashdisk DQLab 64 GB', 55000.00),
('prod-03', 3, 'Gift & Voucher', 'Gift Voucher DQLab 100rb', 100000.00),
('prod-04', 4, 'Aksesoris Komputer', 'Flashdisk DQLab 32 GB', 40000.00),
('prod-05', 5, 'Gift & Voucher', 'Gift Voucher DQLab 250rb', 250000.00),
('prod-06', 6, 'Alat Tulis Kantor', 'Pulpen Multifunction + Laser DQLab', 92500.00),
('prod-07', 7, 'Gift & Voucher', 'Tas Travel Organizer DigiSkills.id', 48000.00),
('prod-08', 8, 'Gift & Voucher', 'Gantungan Kunci DQLab', 15800.00),
('prod-09', 9, 'Alat Tulis Kantor', 'Buku Planner Agenda DQLab', 92000.00),
('prod-10', 10, 'Alat Tulis Kantor', 'Sticky Notes DQLab 500 sheets', 55000.00);

-- 4. Verifikasi data (opsional)
SELECT * FROM ms_produk_dqlab ORDER BY no_urut;


-- Membuat database (opsional)
CREATE DATABASE IF NOT EXISTS dqlab_sales;
USE dqlab_sales;

-- Membuat tabel penjualan sesuai struktur CSV
CREATE TABLE tr_penjualan_dqlab (
    kode_urut_transaksi INT PRIMARY KEY,
    kode_transaksi VARCHAR(20) NOT NULL,
    kode_pelanggan VARCHAR(20) NOT NULL,
    tgl_transaksi DATETIME NOT NULL,
    no_urut INT NOT NULL,
    kode_produk VARCHAR(20) NOT NULL,
    nama_produk VARCHAR(100) NOT NULL,
    qty INT NOT NULL,
    harga DECIMAL(15,2) NOT NULL,
    diskon_persen DECIMAL(5,2) NOT NULL DEFAULT 0.00
);

-- Insert data dari file CSV
INSERT INTO tr_penjualan_dqlab VALUES
(1,'tr-001','dqlabcust07','2020-05-01 00:00:00',1,'prod-01','Kotak Pensil DQLab',5,62500.00,0.00),
(2,'tr-001','dqlabcust07','2020-05-01 00:00:00',2,'prod-03','Flash disk DQLab 32 GB',1,100000.00,25.00),
(3,'tr-001','dqlabcust07','2020-05-01 00:00:00',3,'prod-09','Buku Planner Agenda DQSQuad',3,92000.00,0.00),
(4,'tr-001','dqlabcust07','2020-05-01 00:00:00',4,'prod-04','Flashdisk DQLab 32 GB',3,40000.00,0.00),
(5,'tr-002','dqlabcust00','2020-05-01 00:00:00',1,'prod-03','Gift Voucher DQLab 100rb',2,100000.00,0.00),
(6,'tr-002','dqlabcust00','2020-05-01 00:00:00',2,'prod-10','Sticky Notes DQLab 500 sheets',4,55000.00,0.00),
(7,'tr-002','dqlabcust00','2020-05-01 00:00:00',3,'prod-07','Tas Travel Organizer DQLab',1,48000.00,0.00),
(8,'tr-003','dqlabcust03','2020-05-03 00:00:00',1,'prod-02','Flashdisk DQLab 64 GB',2,55000.00,12.50),
(9,'tr-004','dqlabcust03','2020-05-03 00:00:00',1,'prod-10','Sticky Notes DQLab 500 sheets',5,55000.00,0.00),
(10,'tr-004','dqlabcust03','2020-05-03 00:00:00',2,'prod-04','Flashdisk DQLab 32 GB',4,40000.00,0.00),
(11,'tr-005','dqlabcust00','2020-06-12 00:00:00',1,'prod-09','Buku Planner Agenda DQSQuad',3,92000.00,0.00),
(12,'tr-005','dqlabcust00','2020-06-12 00:00:00',2,'prod-01','Kotak Pensil DQLab',1,62500.00,5.00),
(13,'tr-005','dqlabcust00','2020-06-12 00:00:00',3,'prod-04','Flashdisk DQLab 32 GB',2,40000.00,0.00),
(14,'tr-006','dqlabcust02','2020-06-19 00:00:00',1,'prod-05','Gift Voucher DQLab 250rb',4,250000.00,0.00),
(15,'tr-006','dqlabcust02','2020-06-19 00:00:00',2,'prod-08','Gantungan Kunci DQLab',2,15800.00,0.00);

-- Query verifikasi data
SELECT * FROM tr_penjualan_dqlab ORDER BY kode_urut_transaksi;
-- 4. Verifikasi data (opsional)
SELECT * FROM ms_produk_dqlab ORDER BY no_urut;

