/*Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)*/

-- Таблица для хранения комментариев
DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL COMMENT 'Пост для комментария',
    created_at DATETIME DEFAULT NOW(),
    body TEXT NOT NULL COMMENT 'Тело комментария',

    INDEX (user_id, media_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

-- Таблица для меток для закладок
DROP TABLE IF EXISTS tags;
CREATE TABLE tags(
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    descx VARCHAR(255) NOT NULL DEFAULT 'Default',
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT='Таблица меток для закладок';

-- Создание таблицы для закладок
DROP TABLE IF EXISTS favourites;
CREATE TABLE favourites(
    id SERIAL PRIMARY KEY,
    media_id BIGINT UNSIGNED NOT NULL,
    added_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (media_id) REFERENCES media(id)
) COMMENT='Таблица закладок (любимых постов)';

-- Таблица связки меток и любимых постов. Пост может быть сразу под несколькими фотками а-ля "Важное", "Работа" и т.д.
DROP TABLE IF EXISTS tags_favourites;
CREATE TABLE tags_favourites(
    favourite_id BIGINT UNSIGNED NOT NULL,
    tag_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (favourite_id, tag_id),
    FOREIGN KEY (favourite_id) REFERENCES favourites(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
) COMMENT='Таблица связки меток и любимых постов';

-- Создание таблицы для Черных списков
DROP TABLE IF EXISTS blacklist;
CREATE TABLE blacklist(
    id SERIAL PRIMARY KEY,
    initiator_user_id BIGINT UNSIGNED NOT NULL,
    dest_user_id BIGINT unsigned not NULL,
    added_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (dest_user_id) REFERENCES users(id)
);