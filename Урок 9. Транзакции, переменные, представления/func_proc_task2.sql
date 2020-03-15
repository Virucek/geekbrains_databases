/* В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 * Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
 * Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 * При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */
delimiter //
drop trigger if exists pr_name_desc_ins//
create trigger pr_name_desc_ins before insert on products
for each row
begin 
	if new.name is null and new.description is not null then
		set new.name = coalesce(new.name, new.description);
	elseif new.description is null and new.name is not null then
		set new.description = coalesce(new.description, new.name);
	else
		set new.name = coalesce(new.name, 'default name');
		set new.description = coalesce(new.description, 'default description');
	end if;
end//


delimiter //
drop trigger if exists pr_name_desc_upd//
create trigger pr_name_desc_upd before update on products
for each row
begin 
	if new.name is null and new.description is null then
		signal sqlstate '49000' set message_text = 'UPDATE canceled';
	end if;
end//