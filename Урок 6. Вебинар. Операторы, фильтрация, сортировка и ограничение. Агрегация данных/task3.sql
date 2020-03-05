/*Определить кто больше поставил лайков (всего) - мужчины или женщины?*/

select 
	case
		(
		(select count(*) from likes where user_id in (
			select user_id from profiles where gender = 'M')) >
		(select count(*) from likes where user_id in (
			select user_id from profiles where gender = 'F'))
		)
		when 1 then 'male'
		when 0 then 'female'
	end as result;