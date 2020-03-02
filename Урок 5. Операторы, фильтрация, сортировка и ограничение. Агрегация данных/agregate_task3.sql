/*Подсчитайте произведение чисел в столбце таблицы */

DROP TABLE IF EXISTS dummy_table;
CREATE TABLE dummy_table(
     value bigint
);

insert dummy_table
values (1), (2), (3), (4), (5);

/*Сумма логарифмов равна логарифму произведения подлогарифмических выражений.
После получения логарифма произведения, применяется функция экспоненты (обратная натуральному логарифму,
а log() - натуральный логарифм)*/
select exp(sum(log(value))) total from dummy_table;