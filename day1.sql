CREATE TABLE ogrenci(
ogr_no INT,
ogr_isim varchar(30),
notlar real,
yas int,
adres varchar(50),
kayit_tarih date);
CREATE TABLE ogr_notlari
As
select ogr_no, notlar from ogrenci;
select * from ogrenci;
select * from ogr_notlari;

