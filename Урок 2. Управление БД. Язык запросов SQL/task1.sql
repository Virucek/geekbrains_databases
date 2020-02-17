/*Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, 
задав в нем логин и пароль, который указывался при установке.*/

--mysql установлен. В нем создан пользователь со всеми привилегиями aikin:

create user 'aikin'@'localhost' identified by 'TestPassword1234567#db';
grant all privileges on *.* to 'aikin'@'localhost';

--содержимое файла .my.cnf:
[client]
user=aikin
password=TestPassword1234567#db
