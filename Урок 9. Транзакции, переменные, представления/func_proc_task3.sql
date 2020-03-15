/* Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
 * Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
 * Вызов функции FIBONACCI(10) должен возвращать число 55.
 */

 
delimiter //
drop function if exists FIBONACCI//
create function FIBONACCI(num int)
returns varchar(255) deterministic
begin
	declare i, i_prev, i_num, i_temp int default 0;
	
	while i_num <= num do
		if i_num = 1 then
			set i = 1;
		else
			set i_temp = i;
			set i = i_temp + i_prev;
			set i_prev = i_temp;
		end if;
		set i_num = i_num + 1;
	end while;
	return i;
end//

select FIBONACCI(10);