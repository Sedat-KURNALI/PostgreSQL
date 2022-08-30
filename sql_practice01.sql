-- sql_practise 1                                                                            
create table personel                                                                        
(                                                                                            
id serial primary key  ,                                                                     
isim varchar(20),                                                                            
yas int,                                                                                     
maas int,                                                                                    
email varchar(30)                                                                            
);                                                                                           
																							 
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                
INSERT INTO personel (isim, yas, maas, email) VALUES ('Ali', 39, 12500, 'ali@gmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Derya', 28, 15000, 'derya@yahoo.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Sevim', 24, 25000, 'sevim@hotmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Yusuf', 32, 18000, 'yusuf@gmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Halil', 48, 22000, 'halil@gmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Ece', 54, 21000, 'ece@gmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Can', 38, 19000, 'can@gmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Elif', 27, 14000, 'elif@gmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Ezgi', 38, 21000, 'ezgi@gmail.com');
INSERT INTO personel (isim, yas, maas, email) VALUES ('Sena', 25, 11000, NULL);

SELECT * FROM personel;
-- 1) Tablo bilgilerini listeleyiniz.
SELECT * FROM personel;

-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
SELECT isim, yas, maas WHERE personel;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
SELECT * FROM personel WHERE id = 8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
SELECT isim,yas,email WHERE personel FROM id = 5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas > 30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE maas!=21000;
SELECT * FROM personel WHERE maas!= 21000;

-- 7) ismi e harfi ile başlayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE isim ilike 'e%';

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE isim ilike '%n';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE email ilike '%@gmail.com';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE email not ilike '%@gmail.com';

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE id in(3,5,7,9);

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas not in(39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas between 30 and 40;

-- 14) yaşı 30 ve 40 arasında olmayan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE yas not between 30 and 40;

-- 15) emaili null olan personel bilgilerini listeleyiniz.
SELECT * FROM personel WHERE email IS NULL;

-- 16) personel bilgilerini yaşa göre sıralayınız.
SELECT * FROM personel ORDER BY yas; -- SELECT * FROM personel ORDER BY yas ASC;

-- 17) personel bilgilerini maaşa göre sıralayınız.
SELECT * FROM personel ORDER BY maas;

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
SELECT * FROM personel ORDER BY yas DESC;

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
SELECT * FROM personel ORDER BY maas DESC;

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
SELECT * FROM personel ORDER BY maas DESC LIMIT 3;
