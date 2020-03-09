/*
 * Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.
 */

select 
	id, (select name from cities where label = flights.from) as from_rus, (select name from cities where label = flights.to) as to_rus
from 
	flights;


/*
2-ой вариант решения
*/

select id, rus_from.name as rus_from, rus_to.name as rus_to
from 
	flights
join 
	(select label,name from cities) as rus_from
on from_t = rus_from.label
join 
	(select label,name from cities) as rus_to
on to_t = rus_to.label;