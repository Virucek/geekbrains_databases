/*Подсчитать общее количество лайков, которые получили пользователи младше 10 лет*/


select count(*) as total from likes 
where media_id in (
	select id from media where user_id in (
		select user_id from profiles 
		where TIMESTAMPDIFF(year, birthday, now()) < 10)
	);