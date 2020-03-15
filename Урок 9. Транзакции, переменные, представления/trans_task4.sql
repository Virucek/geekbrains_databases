/* (по желанию) Пусть имеется любая таблица с календарным полем created_at.
 * Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
 */

/* Вариант 1.
 * 
 * Допустим, таблица с которой мы работаем, называется orders (id, user_id, created_at, updated_at).
 * Как вариант, можно создать временную таблицу - полностью копию orders, но только с нужными записами (с 5 самыми важными).
 * Затем очистить изначальную таблицу и залить данные из временной таблицы обратно в исходную 
 */

create temporary table temp (id int, name varchar(255), created_at datetime, updated_at datetime);
insert into temp select from orders order by created_at limit 5;
delete from orders;
insert into order select from temp;


/* Вариант 2. 
 * Решение одним запросом
 */

delete 
from orders 
where id not in (
	select * 
	from (
		select id 
		from orders 
		order by created_at desc 
		limit 5
		) as t)
;
