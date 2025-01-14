/*Посчитайте возраст каждого пользователя в таблице users.

Возраст измерьте числом полных лет, как мы делали в прошлых уроках. Возраст считайте относительно последней даты в таблице user_actions.

Для тех пользователей, у которых в таблице users не указана дата рождения, укажите среднее значение возраста всех остальных пользователей, округлённое до целого числа.

Колонку с возрастом назовите age. В результат включите колонки с id пользователя и возрастом. Отсортируйте полученный результат по возрастанию id пользователя.

Поля в результирующей таблице: user_id, age*/

with t2 as (with t1 as (SELECT date_part('year', age((SELECT max(time) as s1
                                                                              FROM   user_actions), birth_date))::integer as age, user_id
                        FROM   users
                        GROUP BY user_id
                        ORDER BY user_id)
SELECT *
FROM   t1
WHERE  age > 1)
SELECT coalesce(date_part('year', age((SELECT max(time) as s1
                                       FROM   user_actions), birth_date))::integer, (SELECT round(avg(age))
                                              FROM   t2)::integer) as age, user_id
FROM   users
GROUP BY user_id
ORDER BY user_id