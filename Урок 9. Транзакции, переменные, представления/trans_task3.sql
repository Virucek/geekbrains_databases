/*(по желанию) Пусть имеется таблица с календарным полем created_at. 
 * В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
 * Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
 * если дата присутствует в исходном таблице и 0, если она отсутствует.
 */

 /*Пусть работа происходит с таблицей users*/

SET @date_start = '2018-08-01';
SET @date_stop = '2018-08-31';  
  
select
   c.date,
   case count(u.id)
   		when 0 then 0
   		else 1
   	end as existing 
from (
   select date_add(@date_start, interval (@i:=@i+1)-1 day) as `date`
   from information_schema.columns,(select @i:=0) gen_sub 
   where date_add(@date_start,interval @i day) between @date_start and @date_stop
) as c -- calendar table
left join 
	users as u on date_format(u.created_at, '%Y-%m-%d') = c.date
group by c.date
order by c.date
;