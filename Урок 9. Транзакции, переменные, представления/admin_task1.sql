/*Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны 
быть доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.*/

drop user if exists 'shop_read'@'localhost';
create user 'shop_read'@'localhost' identified with sha256_password by 'password';
grant select on *.* to 'shop_read'@'localhost';  -- если необходимы права на чтение только в рамках БД shop, то вместо *.* необходимо использовать shop.*
flush privileges;

drop user if exists 'shop'@'localhost';
create user 'shop'@'localhost' identified with sha256_password by 'pass';
grant all on shop.* to 'shop'@'localhost';
flush privileges;