/*
Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/


-- Задаем пользователя, друга которого будем искать
set @usr = 1;

/* Т.к. JOIN ещё официально не проходили, делаем через union и вложенные запросы. Необходимо отсортировать, чтобы пользователи, сообщения с которыми
мы считаем, были с искомым пользователем активными друзьями, т.е. их запросы дружбы в статусе "appoved" */

select a.user from 
(
	select count(*) as total, to_user_id as user from messages where from_user_id = @usr and to_user_id in (
		select target_user_id as id from friend_requests fr  where initiator_user_id = @usr and status = 'approved'
		union 
		select initiator_user_id as id from friend_requests fr2 where target_user_id = @usr and status = 'approved') group by user
	union
	select count(*) as total, from_user_id as user from messages where to_user_id  = @usr and from_user_id in (
		select target_user_id as id from friend_requests fr  where initiator_user_id = @usr and status = 'approved'
		union 
		select initiator_user_id as id from friend_requests fr2 where target_user_id = @usr and status = 'approved') group by user
) a 
group by a.user
order by sum(a.total) desc
limit 1;