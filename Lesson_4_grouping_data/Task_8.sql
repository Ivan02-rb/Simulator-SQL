/*Разбейте пользователей из таблицы users на группы по возрасту (возраст по-прежнему измеряем числом полных лет) и посчитайте количество пользователей каждого возраста.

Колонку с возрастом назовите age, а колонку с числом пользователей — users_count. Преобразуйте значения в колонке с возрастом в формат INTEGER, чтобы возраст был выражен целым числом.

Результат отсортируйте по колонке с возрастом по возрастанию.

Поля в результирующей таблице: age, users_count*/

SELECT date_part('year', age(birth_date))::integer as age,
       count(user_id) as users_count
FROM   users
GROUP BY age
ORDER BY age