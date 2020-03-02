/*Подсчитайте средний возраст пользователей в таблице users*/

select avg(timestampdiff(year, birthday_at, now())) as avg_age from users;