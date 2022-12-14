CREATE TABLE countries
(
    country_id CHAR(3),
    country_name VARCHAR(50),
    region_id SMALLINT
);
Insert into countries values ('AR','Argentina',2);
Insert into countries values ('AU','Australia',3);
Insert into countries values ('BE','Belgium',1);
Insert into countries values ('BR','Brazil',2);
Insert into countries values ('CA','Canada',2);
Insert into countries values ('CH','Switzerland',1);
Insert into countries values ('CN','China',3);
Insert into countries values ('DE','Germany',1);
Insert into countries values ('DK','Denmark',1);
Insert into countries values ('EG','Egypt',4);
Insert into countries values ('FR','France',1);
Insert into countries values ('IL','Israel',4);
Insert into countries values ('IN','India',3);
Insert into countries values ('IT','Italy',1);
Insert into countries values ('JP','Japan',3);
Insert into countries values ('KW','Kuwait',4);
Insert into countries values ('ML','Malaysia',3);
Insert into countries values ('MX','Mexico',2);
Insert into countries values ('NG','Nigeria',4);
Insert into countries values ('NL','Netherlands',1);
Insert into countries values ('SG','Singapore',3);
Insert into countries values ('UK','United Kingdom',1);
Insert into countries values ('US','United States of America',2);
Insert into countries values ('ZM','Zambia',4);
Insert into countries values ('ZW','Zimbabwe',4);

CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;
--Toplam salary de??eri 2500 ??zeri olan her bir ??al????an i??in salary toplam??n?? bulun.
SELECT name, SUM(salary) AS "Total Salary"
FROM workers
GROUP BY name
HAVING SUM(salary) >= 2500;--> "Group By" ard??ndan "Where" kullan??lmaz.
--Birden fazla ??al????an?? olan, her bir state i??in ??al????an toplamlar??n?? bulun.
SELECT state, COUNT(state) AS number_of_employees
FROM workers
GROUP BY state
HAVING COUNT(state) > 1;--HAVING, Group By ard??ndan filtremele i??in kullan??l??r.
--Her bir state i??in de??eri 3000'den az olan maximum salary de??erlerini bulun.
SELECT state, MAX(salary)
FROM workers
GROUP BY state
HAVING MAX(salary) < 3000;
--Her bir company i??in de??eri 2000'den fazla olan minimum salary de??erlerini bulun.
SELECT company, MIN(salary) AS min_salary
FROM workers
GROUP BY company
HAVING MIN(salary) > 2000;
--Tekrars??z isimleri ??a????r??n.
SELECT DISTINCT name
FROM workers;--DISTINCT clause, ??a??r??lan terimlerden tekrarl?? olanlar??n sadece birincisini al??r.
--Name de??erlerini company kelime uzunluklar??na g??re s??ralay??n.
SELECT name, company
FROM workers
ORDER BY LENGTH(company);
--T??m name ve state de??erlerini ayn?? s??tunda ??a????rarak her bir s??tun de??erinin uzunlu??una g??re s??ralay??n.
--Concat() fonksiyonu birden fazla s??tun veya String de??erini birle??tirmek i??in kullan??l??r.
--1. Yol
SELECT CONCAT(name, ' ', state) AS name_and_state
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);
--2. Yol
SELECT name || ' ' || state || ' ' || LENGTH(name) + LENGTH(state) AS "Name and States"
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);
/*
UNION Operator: 1) ??ki sorgu(query) sonucunu birle??tirmek i??in kullan??l??r.
                2) Tekrars??z(unique) recordlar??  verir.
                3) Tek bir s??tuna ??ok s??tun koyabiliriz.
                4) Tek bir s??tuna ??ok s??tun koyarken mevcut data durumuna dikkat etmek gerekir.
*/
--salary de??eri 3000'den y??ksek olan state de??erlerini ve salary de??eri 2000'den k??????k olan name de??erlerini tekrars??z olarak bulun.
SELECT state AS "Name and State", salary
FROM workers
WHERE salary > 3000
UNION
SELECT name, salary
FROM workers
WHERE salary < 2000;
--salary de??eri 3000'den y??ksek olan state de??erlerini ve 2000'den k??????k olan name de??erlerini tekrarl?? olarak bulun.
SELECT state AS "Name and State", salary
FROM workers
WHERE salary > 3000
UNION ALL --> UNION ile ayn?? i??i yapar. Ancak, tekrarl?? de??erleri de verir.
SELECT name, salary
FROM workers
WHERE salary < 2000;
--salary de??eri 1000'den y??ksek, 2000'den az olan "ortak" name de??erlerini bulun.
SELECT name
FROM workers
WHERE salary > 1000
INTERSECT --INTERSECT Operator: ??ki sorgu (query) sonucunun ortak(common) de??erlerini verir. Unique(tekrars??z) recordlar?? verir.
SELECT name
FROM workers
WHERE salary < 2000;
--salary de??eri 2000'den az olan ve company de??eri  IBM, APPLE yada MICROSOFT olan ortak "name" de??erlerini bulun.
SELECT name
FROM workers
WHERE salary < 2000
INTERSECT
SELECT name
FROM workers
WHERE company IN( 'IBM', 'APPLE', 'MICROSOFT');
--EXCEPT Operator : Bir sorgu sonucundan ba??ka bir sorgu sonucunu ????karmak i??in kullan??l??r. Unique(tekrars??z) recordlar?? verir.
--salary de??eri 3000'den az ve GOOGLE'da ??al????mayan  name de??erlerini bulun.
SELECT name
FROM workers
WHERE salary < 3000
EXCEPT
SELECT name
FROM workers
WHERE company = 'GOOGLE';
-------------------------
CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;
-------------------------
CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;
/*
JOINS: 1) INNER JOIN: Ortak (Common) datay?? verir.
       2) LEFT JOIN: Birinci table'??n t??m datas??n?? verir.
       3) RIGHT JOIN: ??kinci table'??n t??m datas??n?? verir.
       4) FULL JOIN: ??ki table'??n da t??m datas??n?? verir.
       5) SELF JOIN: Tek table ??zerinde ??al??????rken iki table varm???? gibi ??al??????l??r.
*/
--1) INNER JOIN
--Ortak companyler i??in company_name, order_id ve order_date de??erlerini ??a????r??n.
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc INNER JOIN orders o
ON mc.company_id = o.company_id;
-- 2) LEFT JOIN
--my_companies table'??ndaki companyler i??in order_id ve order_date de??erlerini ??a????r??n.
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc LEFT JOIN orders o
ON mc.company_id = o.company_id;
--3) RIGHT JOIN
--Orders table'??ndaki company'ler i??in company_name, company_id ve order_date de??erlerini ??a????r??n.
SELECT mc.company_name, o.company_id, o.order_date
FROM my_companies mc RIGHT JOIN orders o
ON mc.company_id = o.company_id;
--FULL JOIN
--??ki table'dan da company_name, order_id ve order_date de??erlerini ??a????r??n.
SELECT mc.company_name, o.order_id, o.order_date
FROM orders o FULL JOIN my_companies mc
ON mc.company_id = o.company_id;
--SELF JOIN
CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers;
--workers tablosunu kullanarak ??al????anlar??n y??neticilerini g??steren bir tablo haz??rlay??n.
SELECT employee.name AS Employee, manager.name AS Manager
FROM workers employee FULL JOIN workers manager
ON employee.manager_id = manager.id;

