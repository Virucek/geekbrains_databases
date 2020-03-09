/*Выведите список товаров products и разделов catalogs, который соответствует товару.*/

select 
	p.id, p.name, p.price, c.name as catalog_name
from 
	products p
join
	catalogs c
on p.catalog_id = c.id;

/*
2 вариант решения (вывод всех полей из обоих таблиц):
*/
select 
	p.*, c.*
from 
	products p
join
	catalogs c
on p.catalog_id = c.id;
