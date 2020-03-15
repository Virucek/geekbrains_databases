/*Создайте представление, которое выводит название name товарной позиции 
из таблицы products и соответствующее название каталога name из таблицы catalogs.*/


create view product_catalog as 
	select p.name as product_name, c.name as catalog_name
	from 
		products p
	join
		catalogs c
	on p.catalog_id = c.id
;