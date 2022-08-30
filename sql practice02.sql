CREATE TABLE workers (
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers;

-- Tabloya company_industry isminde sütun ekleyiniz
ALTER TABLE workers ADD COLUMN company_industry VARCHAR(20)  ;

-- TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
ALTER TABLE workers ADD COLUMN worker_address VARCHAR(100) default 'Miami, FL, USA' ;

-- tablodaki worker_address sütununu siliniz
ALTER TABLE workers DROP COLUMN worker_address  ;

-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
ALTER TABLE workers RENAME COLUMN company_industry TO company_profession  ;

-- Tablonun ismini employees olarak değişitiriniz.
ALTER TABLE workers RENAME TO employees ;
SELECT * FROM employees;


SELECT * FROM workers;

-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
ALTER TABLE employees ALTER title TYPE VARCHAR(50)  ;
SELECT * FROM employees;


-- Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
ALTER TABLE employees ADD CONSTRAINT title UNIQUE (title);
SELECT * FROM employees;




