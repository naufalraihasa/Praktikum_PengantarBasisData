-- -----------------NOMOR 1----------------------

-- create database
create database PBD_NAUFALRAIHASA;

-- select database to use
use PBD_NAUFALRAIHASA;


-- -----------------NOMOR 2----------------------

-- MEMBUAT TABEL M_FAKULTAS
create table M_FAKULTAS
(
	K_FAKULTAS varchar(3) not null primary key,
    SINGKAT varchar(10),
    CONTENT varchar(45)
);

-- MEMBUAT TABEL M_JENJANG
create table M_JENJANG
(
	K_JENJANG varchar(3) not null primary key,
    SINGKAT varchar(10),
    CONTENT varchar(30)
);

-- MEMBUAT TABEL M_JURUSAN
create table M_JURUSAN 
(
	K_JURUSAN varchar(3) not null primary key,
    K_JENJANG varchar(3),
    K_FAKULTAS varchar(3),
    SINGKAT varchar(10),
    CONTENT varchar(45)
);

-- MEMBUAT TABEL M_PROG_STUDI
create table M_PROG_STUDI
(
	K_PROG_STUDI varchar(3) not null primary key,
    K_FAKULTAS varchar(3),
    K_JENJANG varchar(3),
    K_JURUSAN varchar(3),
    SINGKAT varchar(10),
    CONTENT varchar(60)
);

-- MEMBUAT TABEL M_KELAS
create table M_KELAS
(
	K_KELAS varchar(3) not null primary key,
    SINGKAT varchar(10),
    CONTENT varchar(45)
);

-- MEMBUAT TABEL M_SELEKSI
create table M_SELEKSI
(
	K_SELEKSI varchar(3) not null primary key,
    SINGKAT varchar(10),
    CONTENT varchar(45)
);

-- MEMBUAT TABEL M_CABANG
create table M_CABANG
(
	K_CABANG varchar(3) not null primary key,
    SINGKAT varchar(10),
    CONTENT varchar(45)
);

-- MEMBUAT TABEL MHS_KOTA
create table MHS_KOTA
(
	NIM varchar(15),
    K_PROPINSI varchar(9),
    K_NEGARA varchar(9),
    K_KOTA varchar(9),
    ALAMAT varchar(100),
    KODE_POS varchar(9)
);

-- MEMBUAT TABEL MAHASISWA
create table MAHASISWA
(
	NIM varchar(15) not null primary key,
    NAMA varchar(60),
    ANGKATAN INT,
    K_JURUSAN varchar(3),
    K_JENJANG varchar(3),
    K_FAKULTAS varchar(3),
    K_PROG_STUDI varchar(3),
    K_SELEKSI varchar(3),
    K_KELAS varchar(3),
    K_CABANG varchar(3)
);

-- MEMBUAT TABEL M_KOTA
create table M_KOTA
(
	K_KOTA varchar(9) not null primary key,
    K_NEGARA varchar(9),
    K_PROPINSI varchar(9),
    CONTENT varchar(100)
);

-- MEMBUAT TABEL M_PROPINSI
create table M_PROPINSI
(
	K_PROPINSI varchar(9) not null primary key,
    K_NEGARA varchar(9),
    CONTENT varchar(100)
);

-- MEMBUAT TABEL M_NEGARA
create table M_NEGARA
(
	K_NEGARA VARCHAR(9) not null primary key,
    CONTENT varchar(15)
);

-- membuat relasi antara tabel M_FAKULTAS , M_JENJANG dengan M_JURUSAN
alter table M_JURUSAN
add foreign key (K_FAKULTAS) references M_FAKULTAS (K_FAKULTAS) on delete cascade,
add foreign key (K_JENJANG) references M_JENJANG (K_JENJANG) on delete cascade;
    
-- membuat relasi antara tabel M_PROG_STUDI dengan M_JURUSAN
alter table M_PROG_STUDI
add foreign key (K_JURUSAN) references M_JURUSAN (K_JURUSAN) on delete cascade,
add foreign key (K_JENJANG) references M_JURUSAN (K_JENJANG) on delete cascade,
add foreign key (K_FAKULTAS) references M_JURUSAN (K_FAKULTAS) on delete cascade;
    
-- membuat relasi antara tabel MAHASISWA 
-- dengan tabel M_PROG_STUDI, M_KELAS, M_SELEKSI, M_CABANG

alter table MAHASISWA 
add foreign key (K_JURUSAN) references M_PROG_STUDI (K_JURUSAN) on delete cascade,
add foreign key (K_JENJANG) references M_PROG_STUDI (K_JENJANG) on delete cascade,
add foreign key (K_FAKULTAS) references M_PROG_STUDI (K_FAKULTAS) on delete cascade,
add foreign key (K_PROG_STUDI) references M_PROG_STUDI (K_PROG_STUDI) on delete cascade,
add foreign key (K_SELEKSI) references M_SELEKSI (K_SELEKSI) on delete cascade,
add foreign key (K_KELAS) references M_KELAS (K_KELAS) on delete cascade,
add foreign key (K_CABANG) references M_CABANG (K_CABANG) on delete cascade
;

-- membuat relasi antara tabel MAHASISWA dan MHS_KOTA
alter table MHS_KOTA
add foreign key (NIM) references MAHASISWA (NIM) on delete cascade
;

-- membuat relasi antara tabel M_PROPINSI dengan tabel M_NEGARA
alter table M_PROPINSI
add foreign key (K_NEGARA) references M_NEGARA (K_NEGARA) on delete cascade;

-- membuat relasi antara tabel M_KOTA dengan tabel M_PROPINSI
alter table M_KOTA
add foreign key (K_NEGARA) references M_PROPINSI (K_NEGARA) on delete cascade,
add foreign key (K_PROPINSI) references M_PROPINSI (K_PROPINSI) on delete cascade;

-- membuat relasi antara tabel MHS_KOTA dengan tabel M_KOTA
alter table MHS_KOTA 
add foreign key (K_PROPINSI) references M_KOTA (K_PROPINSI) on delete cascade,
add foreign key (K_NEGARA) references M_KOTA (K_NEGARA) on delete cascade,
add foreign key (K_KOTA) references M_KOTA (K_KOTA) on delete cascade;


-- -----------------NOMOR 3----------------------

-- mengubah struktur dari MHS_KOTA MENJADI :
-- MENAMBAH PRIMARY KEY (NIM)
-- ALAMAT (110)
-- KODE_POS (6)
ALTER TABLE MHS_KOTA
add primary key (NIM),
change column ALAMAT ALAMAT varchar(110),
change column KODE_POS KODE_POS varchar(6);


-- -----------------NOMOR 4----------------------
-- membuat duplikat tabel MHS_KOTA dengan nama MHS_KOTA2
create table MHS_KOTA2 like MHS_KOTA;

alter table MHS_KOTA2
add foreign key (K_PROPINSI) references M_KOTA (K_PROPINSI) on delete cascade,
add foreign key (K_NEGARA) references M_KOTA (K_NEGARA) on delete cascade,
add foreign key (K_KOTA) references M_KOTA (K_KOTA) on delete cascade,
add foreign key (NIM) references MAHASISWA (NIM) on delete cascade;


-- -----------------NOMOR 5----------------------

-- menghapus tabel MHS_KOTA
drop table MHS_KOTA;




-- -----------------NOMOR 6----------------------

-- mengubah nama tabel MHS_KOTA2 menjadi MHS_KOTA
alter table MHS_KOTA2
rename to MHS_KOTA;



-- -----------------NOMOR 7----------------------
-- rename semua tabel dengan menghapus M_ dan MHS_ dan KOTA menjadi KOTA2
rename table
M_CABANG to CABANG,
M_FAKULTAS to FAKULTAS,
M_JENJANG to JENJANG,
M_JURUSAN to JURUSAN,
M_KELAS to KELAS,
M_KOTA to KOTA,
M_NEGARA to NEGARA,
M_PROG_STUDI to PROG_STUDI,
M_PROPINSI to PROPINSI,
M_SELEKSI to SELEKSI,
MHS_KOTA to KOTA2
;