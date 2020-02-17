/*Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.*/

--Добавил запись в таблицу users базы example
--Создание дампа базы данных example
sudo mysqldump example > example_dump.sql

--Создание базы данных sample
CREATE DATABASE sample;

--Заполнение sample из дампа
sudo mysql sample < example_dump.sql

--Проверка, что таблица и содержимое развернулось
USE sample;
SHOW TABLES;
SELECT * FROM users;
