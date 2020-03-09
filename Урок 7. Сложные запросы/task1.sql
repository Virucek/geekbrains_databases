/*Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине*/

select * from users 
where exists (select 1 from orders where user_id = users.id);