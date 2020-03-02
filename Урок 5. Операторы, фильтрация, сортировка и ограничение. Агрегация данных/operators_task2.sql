/*Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.*/

UPDATE users 
set 
created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

alter table users modify column created_at DATETIME;

alter table users modify column updated_at DATETIME;