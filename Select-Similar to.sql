-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
	SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
	Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir
	REGEX : Herhangi bir kod, medin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
	kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır
	PostgreSQL'de "~" karakteri ile kullanılır.
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
 INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1005, 'hct', 3);
INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

SELECT * FROM kelimeler;


--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya işlemi için | karakteri kullanılır
--SIMILAR TO ile
SELECT * from kelimeler WHERE kelime SIMILAR TO '%(at|ot|Ot|oT|At|aT|OT)%';
--LIKE ile
SELECT * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%';
SELECT * from kelimeler WHERE kelime ~~* '%at%' or kelime ~~* '%ot%'
--REGEX
seleSELECTct * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at'
SELECT * from kelimeler WHERE kelime ~* 'ot' OR kelime ~* 'at';

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ile
SELECT * from kelimeler WHERE kelime SIMILAR TO 'ho%|hi%';
--LIKE ile
SELECT * from kelimeler WHERE kelime ~~* 'ho%' or kelime ~~* 'hi%'
--REGEX
SELECT * from kelimeler WHERE kelime ~* 'h[oi](.*)';



SELECT * from kelimeler WHERE kelime ~* '(.*)[tm]$';

SELECT * from kelimeler WHERE kelime ~* 'h[a-zA-Z0-9]t';

--  İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 
-- 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
SELECT * FROM kelimeler WHERE kelime ~* 'h[a-eA-E](.*)t';

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
SELECT * FROM kelimeler WHERE kelime ~* '^[asy](.*)';

SELECT * FROM kelimeler WHERE kelime ~* '(.*)[maf]$';

SELECT * FROM kelimeler WHERE kelime ~* 'h[a-eA-E](.*)t';

SELECT * FROM kelimeler WHERE kelime ~* '^h[ai]t$';

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
SELECT * FROM kelimeler WHERE kelime ~* '^[b-s](.)l(.*)';

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
SELECT * FROM kelimeler WHERE kelime ILIKE '%o%o%' ;
-- İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--SIMILAR to ile
select * from kelimeler where kelime similar to 'h[a|i]t';
-- REGEX ile
select * from kelimeler where kelime ~ '^h[a|i]t$'
--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)'
--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%'
select * from kelimeler where kelime similar to '%[o]{2}%'


SELECT * FROM kelimeler WHERE kelime ILIKE '%o%o%' OR kelime ~~* 'hi%'

--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%'
select * from kelimeler where kelime similar to '%[o]{2}%' -- Süslü parantez içinde belirttiğimiz rakam bir önceki
                                                           --köşeli parantez içinde kaçtane olduğunu belirtir

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

SELECT * FROM kelimeler WHERE kelime ILIKE '%o%o%o%o%' ;



