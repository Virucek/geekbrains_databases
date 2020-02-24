/*Написать скрипт, отмечающий несовершеннолетних пользователей 
как неактивных (поле is_active = false). 
Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)*/

ALTER TABLE profiles ADD COLUMN is_active BOOLEAN NOT NULL DEFAULT true;

-- Обновляем записи несовершеннолетних пользователей

update profiles 
set is_active = false 
where to_days(curdate()) - to_days(birthday) < 18 * 365 + 4;