-- Nama 	: Maulana Algi Fari
-- NIM 		: 24241109
-- Kelas 	: C
-- Modul 	: 4

-- menggunakan database
USE kelas_c_mart;

-- ORDER BY
-- klausa dalam SQL yang digunakan untuk mengurutkan data berdasarkan kolom 
-- atau pengolahan kolom (hasil ekspresi matematika)

-- Praktek 1
-- ambil nama_produk, qty dari tabel penjualan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- Praktek 2
-- ambil nama_produk, qty dari tabel penjualan berdasarkan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- Latihan mandiri #1
-- saoal 1
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;
-- soal 2
SELECT * FROM pelanggan ORDER BY nama_pelanggan;
-- soal 3
SELECT * FROM ms_pelanggan ORDER BY alamat;


-- Praktek 3
-- ambil nama_produk dan qty dari tabel penjualan urut qty terbesar ke kecil 
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- Praktek 4
-- ambil nama_produk dan qty dari tabel penjualan urut qty, nama_produk terbesar ke kecil 
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk;

-- Latihan mandiri #2
-- saoal 1
SELECT * FROM tr_penjualan ORDER BY tgl_transaksi DESC, qty ASC;
-- soal 2
SELECT * FROM pelanggan ORDER BY nama_pelanggan DESC;
-- soal 3
SELECT * FROM pelanggan ORDER BY alamat DESC;


-- ORDER BY dari hasil hitungan
-- Praktek 5
-- ambil nama_produk, qty, harga, dan aty*harga, urutkan dan berdasar kan total besar
SELECT nama_produk, qty, harga, qty*harga AS total FROM tr_penjualan ORDER BY total DESC;

-- Latihan mandiri #3
-- saoal 1
SELECT nama_produk,
       qty,
       harga,
       diskon_persen,
       (qty * harga - diskon_persen) AS total_harga
FROM tr_penjualan
ORDER BY total_harga DESC;


-- WHERE dengan ORDER BY
-- mengurutkan (ORDER BY) hasil filter data (WHERE)
-- Praktek 6
-- ambil semuan nama_produk dan qty yang huruf depannya 'F' urut qty
SELECT nama_produk, qty FROM tr_penjualan WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Latihan mandiri #4
-- saoal 1
SELECT * FROM tr_penjualan WHERE diskon_persen > 0 ORDER BY harga DESC;
-- soal 2
SELECT nama_produk, qty, harga FROM tr_penjualan WHERE harga >= 100000 ORDER BY harga DESC;
-- soal 3
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 OR nama_produk LIKE 'T%' ORDER BY diskon DESC;


-- FUNGSI AGREGASI
-- fungsi agregasi mengelola beberapa row (baris) data untuk mengenghasilkan nilai barui
-- Bentuk sum, AVERAGE, MAX, MIN
-- Praktek 7
-- Jumlahkan qty dari semua transaksi penjualan
SELECT SUM(qty) FrOM tr_penjualan;

-- Praktek 8
-- berapa rata rata qty dari semua tranksasi penjualan
SELECT AVG(qty) FROM tr_penjualan;

-- Praktek 9
-- berapa jumlah transaksi
SELECT COUNT(no_urut) FROM tr_penjualan;

-- Praktetk 10
-- berapa pelanggan unik yang bertransaksi
SELECT COUNT(DISTINCT kode_pelanggan) FROM tr_penjualan;

-- Praktek 11
-- qty max dan min dari tranksasi penjualan
SELECT MAX(qty), MIN(qty) FROM tr_penjualan;

-- Praktek 12
-- Tampilkan jumlah seruluh barish penlanggan dan pelanggan unik
SELECT COUNT(*), COUNT(DISTINCT kode_pelanggan) FROM tr_penjualan;

-- Praktek 13
-- Penggunaan kolom lain + Agregasi
SELECT nama_produk, MAX(qty) FROM tr_penjualan;

-- GROUP BY
-- mengelompokan data berdasarkan satu kolom yang di pilih
-- Praktek 14
SELECT nama_produk FROM tr_penjualan; -- sebelum GROUP BY
SELECT nama_produk FROM tr_penjualan GROUP BY nama_produk; -- sesudah GROUP BY
-- bedaa dengan agregasi cOUNT DISTINCT
SELECT COUNT(distinct nama_produk) FROM tr_penjualan;

-- Dua kolom atau lebih
-- praktek 15
SELECT nama_produk, qty FROM tr_penjualan GROUP BY nama_produk, qty;

-- Praktek 16
-- GROUP BY dengan agregasi
-- Ambil jumlah qty bersarkan nama produk
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk;

-- Praktek 17
-- GROUP BY + agregasi + ORDER by
-- Ambil jumlah qty bersarkan kelompok nama produk, urut qty terbesar
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk ORDER BY SUM(qty) DESC;

-- Praktek 18
-- HAVING
-- sama seperti WHERE yaitu sebagai filter khusus untuk group by
-- HAVINg filter khusuh untuk ahasil agregasi
-- ambil jumlah qty berdasarkan kelompok nama produk ,yang jumlah qty < 6 urut qty terbesar
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk HAVING SUM(qty) < 6 ORDER BY SUM(qty) DESC;


-- Latihan mandiri #5
-- saoal 1
SELECT nama_produk, SUM(qty) AS total_terjual FROM tr_penjualan GROUP BY nama_produk HAVING SUM(qty) > 4;
-- soal 2
SELECT nama_produk, SUM(qty) AS total_terjual FROM tr_penjualan GROUP BY nama_produk HAVING SUM(qty) = 9;
-- soal 3
SELECT nama_produk, SUM((qty * harga) - diskon_persen) AS total_penjualan FROM tr_penjualan GROUP BY nama_produk 
ORDER BY total_penjualan DESC;


