-- -------------------- declare database -----------------
use pbd_naufal;

-- --------------------- hapus foreign --------------------
show create table mahasiswa;
alter table mahasiswa
drop foreign key mahasiswa_ibfk_3;

-- ------------------- drop table kelas -------------------
drop table kelas;

-- ----------------- cek file convert excel ---------------
select * from pbd_a2;

-- -------------------- menambah kolom ---------------------
alter table mahasiswa
add column pulau varchar(25),
add column tanggal_lahir text
;

-- ------------ mengubah kolom menjadi null-able -----------
alter table mahasiswa
change column angkatan angkatan varchar(25) null,
change column k_jurusan k_jurusan varchar(25) null,
change column k_jenjang k_jenjang varchar(25) null,
change column k_fakultas k_fakultas varchar(25) null,
change column k_prog_studi k_prog_Studi varchar(25) null,
change column k_seleksi k_seleksi varchar(25) null,
change column k_kelas k_kelas varchar(25) null,
change column k_cabang k_cabang varchar(25) null
;

-- ---- assign nilai dari tabel mhs_tsd ke tabel mahasiswa -----
INSERT INTO mahasiswa 
(
	nim, nama, angkatan, pulau, tanggal_lahir
)
select 
	Nim, Nama, angkatan, Pulau, TanggalLahir 
from 
pbd_a2;

select * from mahasiswa;

-- --------------- luar jawa ---------------------
SELECT 
    *
FROM
   mahasiswa
WHERE
   pulau NOT IN ('jawa');

-- ----------------- NIM ganjil ---------------
SELECT 
    *
FROM
    mahasiswa
WHERE
    NIM LIKE ('%1') or
    NIM LIKE ('%3') or
    NIM LIKE ('%5') or
    NIM LIKE ('%7') or
    NIM LIKE ('%9');

-- -------------------- angkatan 2021 ------------------
SELECT 
    *
FROM
    mahasiswa
WHERE
    angkatan = '2021';

-- ------------------------ umur --------------------
UPDATE mahasiswa 
SET 
    tanggal_lahir = STR_TO_DATE(tanggal_lahir, '%d/%m/%Y');
SELECT 
    *, YEAR(NOW()) - YEAR(tanggal_lahir) as umur
FROM
    MAHASISWA
WHERE
    YEAR(NOW()) - YEAR(TANGGAL_LAHIR) < 20;

-- ---------------------- umur (cara lain) -------------------------
UPDATE mahasiswa 
SET 
    tanggal_lahir = STR_TO_DATE(tanggal_lahir, '%d/%m/%Y');
UPDATE mahasiswa 
SET 
    umur = YEAR(NOW()) - YEAR(tanggal_lahir);

select * from mahasiswa;

-- ------------------- status -----------------------
alter table mahasiswa
add column mhs_status varchar(10);

select * from mahasiswa;

UPDATE mahasiswa
SET    mhs_status = 'aktif';