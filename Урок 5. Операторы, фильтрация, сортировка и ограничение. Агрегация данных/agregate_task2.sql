/*Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

 -- решение 1 через CASE

SELECT
  CASE
  	dayofweek(date_add(birthday_at, interval (year(now()) - year(birthday_at)) year))
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    ELSE 'Saturday'
  END AS birthday,
  count(*) AS total
FROM
  Users
GROUP BY birthday;


-- решение 2 через DAYNAME

SELECT
  dayname(date_add(birthday_at, interval (year(now()) - year(birthday_at)) year)) as birthday,
  count(*) as total
FROM
  Users
GROUP BY birthday;