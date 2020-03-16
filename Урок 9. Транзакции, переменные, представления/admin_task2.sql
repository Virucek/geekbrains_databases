/* Пусть имеется таблица accounts содержащая три столбца id, name, password,
 * содержащие первичный ключ, имя пользователя и его пароль. 
 * Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
 * Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.
 */

 -- Создадим БД test_lesson9

drop database if exists test_lesson9;
create database test_lesson9;
use test_lesson9;

 -- Создадим таблицу accounts в БД test_lesson9

create table accounts (
	id serial primary key,
	name varchar(255) not null,
	password varchar(255) not null
	);

-- Создадим представление username

create view username
	as select id, name from accounts;

-- Создадим пользователя shop_read, который бы имел доступ только к представлению username

drop user if exists 'shop_read'@'localhost';
create user 'shop_read'@'localhost';
grant select on test_lesson9.username to 'shop_read'@'localhost';
flush privileges;