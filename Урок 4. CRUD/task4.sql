/*Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)*/

delete from messages
	where created_at > now();