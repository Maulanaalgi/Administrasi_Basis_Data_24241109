-- Nama   : maulana algi fari
-- NIM	  : 24241109
-- Kelas  : C
-- Modul  : 5

-- DATABASE
USE kelas_c_mart;
USE dqlab_db;
USE dqlab_sales;

-- Praktikum #1
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp JOIN kelas_c_mart.pelanggan mp  ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktikum #2
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp JOIN kelas_c_mart.pelanggan mp ON true;

-- Praktikum #3
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp INNER JOIN kelas_c_mart.pelanggan mp ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktikum #4
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp LEFT OUTER JOIN kelas_c_mart.pelanggan mp ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktikum #5
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty FROM tr_penjualan_dqlab tp RIGHT OUTER JOIN kelas_c_mart.pelanggan mp  ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktikum #6
SELECT tp.kode_pelanggan, mp.nama_pelanggan, 
	   mpd.kategori_produk , mpd.nama_produk , tp.qty
	FROM kelas_c_mart.pelanggan mp 
	LEFT OUTER JOIN dqlab_sales.tr_penjualan_dqlab tp 
		ON mp.kode_pelanggan = tp.kode_pelanggan
	LEFT OUTER JOIN dqlab_db.ms_produk_dqlab mpd
		ON mpd.kode_produk = tp.kode_produk;

-- Praktikum #7
SELECT tp.kode_pelanggan, mp.nama_pelanggan, 
	   mpd.kategori_produk , mpd.nama_produk , tp.qty
	FROM kelas_c_mart.pelanggan mp 
	LEFT OUTER JOIN dqlab_sales.tr_penjualan_dqlab tp 
		ON mp.kode_pelanggan = tp.kode_pelanggan
	LEFT OUTER JOIN dqlab_db.ms_produk_dqlab mpd
		ON mpd.kode_produk = tp.kode_produk
   ORDER BY qty DESC;

-- Praktikum #8
SELECT mpd.kategori_produk , mpd.nama_produk , sum(tp.qty) as qty
	FROM kelas_c_mart.pelanggan mp 
	LEFT OUTER JOIN dqlab_sales.tr_penjualan_dqlab tp 
		ON mp.kode_pelanggan = tp.kode_pelanggan
	LEFT OUTER JOIN dqlab_db.ms_produk_dqlab mpd
		ON mpd.kode_produk = tp.kode_produk
   GROUP BY mpd.kategori_produk , mpd.nama_produk
   ORDER BY sum(qty) DESC;

-- Praktikum #9
SELECT kode_produk, nama_produk 
	FROM dqlab_db.ms_produk_dqlab 
UNION 
SELECT kode_pelanggan, nama_pelanggan 
	FROM kelas_c_mart.pelanggan; 

-- Praktikum #10
SELECT 'produkam' AS kategori, nama_produk AS nama
	FROM dqlab_db.ms_produk_dqlab 
UNION 
SELECT 'pelanggan', nama_pelanggan 
	FROM kelas_c_mart.pelanggan;

-- Praktikum #11
SELECT kode_produk, nama_produk 
	FROM dqlab_db.ms_produk_dqlab 
UNION 
SELECT kode_produk, nama_produk 
	FROM dqlab_db.ms_produk_dqlab; 

-- Praktikum #12
SELECT nama_produk 
	FROM dqlab_db.ms_produk_dqlab 
UNION 
SELECT nama_produk 
	FROM dqlab_sales.tr_penjualan_dqlab; 

-- Praktikum #13
SELECT kode_produk, nama_produk 
	FROM dqlab_db.ms_produk_dqlab 
UNION ALL
SELECT kode_produk, nama_produk 
	FROM dqlab_db.ms_produk_dqlab; 

-- Praktikum #14
SELECT nama_produk 
	FROM dqlab_db.ms_produk_dqlab 
UNION ALL
SELECT nama_produk 
	FROM dqlab_sales.tr_penjualan_dqlab;
    
-- Praktikum #15
SELECT nama_produk 
	FROM dqlab_db.ms_produk_dqlab 
UNION ALL
SELECT nama_produk 
	FROM dqlab_sales.tr_penjualan_dqlab LIMIT 1

-- Latihan mandiri #1
-- blok dan jalankan dengan ctrl+shift+enter
SELECT * FROM kelas_c_mart.pelanggan mp
INNER JOIN dqlab_sales.tr_penjualan_dqlab tp 
   ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN dqlab_db.ms_produk_dqlab mpr 
   ON tp.kode_produk = mpr.kode_produk;
   
-- Latihan mandiri #2
SELECT *
FROM kelas_c_mart.pelanggan mp
LEFT JOIN dqlab_sales.tr_penjualan_dqlab tp ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN dqlab_db.ms_produk_dqlab mpr ON tp.kode_produk = mpr.kode_produk
WHERE tp.qty IS NOT NULL;

-- latihan mandiri #3
SELECT 
    mpr.kategori_produk,
    SUM(tp.qty) AS total_qty
FROM kelas_c_mart.pelanggan mp
INNER JOIN dqlab_sales.tr_penjualan_dqlab tp ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN dqlab_db.ms_produk_dqlab mpr ON tp.kode_produk = mpr.kode_produk
GROUP BY mpr.kategori_produk;

-- Latihan Khusus!
SELECT 
    p1.kode_produk AS kode_produk_1,
    p1.nama_produk AS nama_produk_1,
    p2.kode_produk AS kode_produk_2,
    p2.nama_produk AS nama_produk_2
FROM dqlab_db.ms_produk_dqlab p1
INNER JOIN dqlab_db.ms_produk_dqlab p2 ON p1.kode_produk = p2.kode_produk;

