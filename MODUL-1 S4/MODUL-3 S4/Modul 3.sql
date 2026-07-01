-- Nama : Maulana Algi Fari
-- NIM : 24241109
-- Kelas : C
-- Modul : 3

-- menggunakan database
USE kelas_c_mart;

-- nilai iteral, operator matematika, perbandingan, logika
-- fungsi matematika dan tanggal (Date)
-- Klausal WHERE, LIKE

-- praktek 1
-- Menggunakan nilai literal pada SELECT
SELECT 77;

-- praktek 2
-- menggunakan SELECT untuk menampilkan nilai literal dengan tipe data yang berbeda
SELECT 77 AS angka, false AS nilai_logika, 'PTI'As teks;


-- NULL
-- berarti tidak memiliki nilai apapun atau kosong
-- praktek 3
-- menggunakan SELECT untuk menggunakan NULL
SELECT NULL AS kosong;

-- Operator matematika
-- praktek 4
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi_1, 5 DIV 2 AS hasil_bagi_2;

-- latihan mandiri 1
SELECT 5*4;
SELECT (4*8)%7;
SELECT (4*8) mod 7;

select 5*4;
SELECT 12+4;
SELECT 20-7;
select 81/9;
select 25 mod 4;
select (10+5)*2;
SELECT ((8*5)+10)%6; 

-- praktek 5
-- menggunakan database
USE pti_mart;

-- operatpr matematika untuk dua kolom dalam tabel penjualan
-- ambil data hasil perkalian kolom qty dan harga simpan dalam kolom total beli
-- praktek 6
SELECT qty_harga AS total_beli FROM tr_penjualan;

-- operator perbandingan 
-- simbol untuk membandingkan nilai dari nilai literal ataupun hasil ekspresi matematika
-- praktek 7
SELECT 5=5, 5!=5, 5!=4;

-- latihan mandiri 2
SELECT 1 = true;
SELECT 1 = false;
SELECT 5 >= 5;
SELECT 5.2=5.20000;
SELECT NULL = 1;
SELECT NULL = NULL;
SELECT NULL is NULL;

-- fungsi
-- proses yang memiliki nama, bukan simbol seperti 
-- praktek 8
SELECT POW(3,2), ROUND(3.14), ROUND(3.54), RAUND(3.155, 1), 
ROUND(3.155,2), FLOOR(4.28), FLOOR(4.78), CEILING(4.39), CEILING (4.55);

-- praktek 9
SELECT NOW(), YEAR ('2022-05-03'),
ROUND(DATEDIFF(NOW(), '2022-05-03') / 30),
DAY('2022-05-03');

-- latihan mandiri 3
SELECT DATEDIFF('2022-07-23', NOW());
SElECT YEAR('2022-07-23');
SELECT MONTH('2022-07-23');
SELECT  DAY('2022-07-23');
SELECT YEAR(NOW());

-- fungsi penting lainnya
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

-- Praktek 10
SELECT datediff(NOW(),tgl_transaksi) FROM tr_penjualan;
SELECT datediff(tgl_transaksi, NOW()) FROM tr_penjualan;

-- Filtering with where
-- untuk mefirtel ataau menyaring data
SELECT nama_produk, qty FROM tr_penjualan WHERE qty>2;

-- Praktek 11
-- ambil semua data pada kolom nama produk dan qty, yang qty > 3
SELECT nama_produk, qty 
FROM tr_penjualan 
WHERE qty>3;

-- ambil semua data pada kolom nama produk dan hargan, dengan max 10000
SELECT nama_produk, harga
FROM tr_penjualan 
WHERE harga <=10000;

-- praktek 12
-- multi kriteria dalam WHERE
SELECT nama_produk, qty, tgl_transaksi FROM tr_penjualan;
-- ambil semua produk dan qty yang qty > 3 DAN tgl transasksi pada bulan 7
SELECT nama_produk, qty
FROM tr_penjualan WHERE qty>3 AND
MONTH(tgl_transaksi) =6;

-- praktek 13
-- WHERE dengan Kriteria teks
-- ambil semua nama_produk yang bernama 'Flashdisk DQLab 32 GB'
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk  = 'Flashdisk DQLab 32 GB';

-- Operator perbandingan LIKE
-- Praktek 14
-- WHERE dengan operator LIKE
-- ambil semua nama_produk yang namanya berawala huruf 'f'
SELECT nama_produk FROM  tr_penjualan
WHERE nama_produk LIKE 'F%';

-- latihan mandiri 4
-- 1. nama_produk yang memiliki karakter kedua 'a' pada tabel tr_penjualan_dqlab
SELECT *
FROM tr_penjualan
WHERE nama_produk LIKE '_a%';

-- 2. kategori_produk yang mengandung huruf 'f' pada tabel ms_produk_dqlab
SELECT *
FROM produk
WHERE kategori_produk LIKE '%f%';

-- 3. kategori_produk yang mengandung karakter 'un' pada tabel ms_produk_dqlab
SELECT *
FROM produk
WHERE kategori_produk LIKE '%un%';


-- Praktek 15
-- WHERE dengan operator perbandingan (AND, OR, NOT, XOR)
-- Ambil semua produk yang berawalan huruf 'F' AND/dan qty > 2
SELECT nama_produk, qty FROM tr_penjualan
WHERE nama_produk LIKE 'F%' AND qty > 2;

-- Praktek 16
-- Ambil semua produk 
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'F%' OR qty > 2;






