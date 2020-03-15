/*
 * Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
 * С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна 
 * возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
 */

delimiter //
drop function if exists hello//
create function hello ()
returns text deterministic
begin
	case (date_format(now(), '%H') div 6)
		when 0 then
	    	return 'Доброй ночи';
	    when 1 then
	    	return 'Доброе утро';
	    when 2 then
	    	return 'Добрый день';
	    when 3 then
	    	return 'Добрый вечер';
 	end case;
end//
