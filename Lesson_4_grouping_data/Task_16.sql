/*Разбейте пользователей из таблицы users на 4 возрастные группы:

от 18 до 24 лет;
от 25 до 29 лет;
от 30 до 35 лет;
старше 36.
Посчитайте число пользователей, попавших в каждую возрастную группу. Группы назовите соответственно «18-24», «25-29», «30-35», «36+» (без кавычек).

В расчётах не учитывайте пользователей, у которых не указана дата рождения. Как и в прошлых задачах, в качестве возраста учитывайте число полных лет.

Выведите наименования групп и число пользователей в них. Колонку с наименованием групп назовите group_age, а колонку с числом пользователей — users_count.

Отсортируйте полученную таблицу по колонке с наименованием групп по возрастанию.

Поля в результирующей таблице: group_age, users_count

*/

SELECT case when date_part('year', age(birth_date)) :: integer >= 18 and
                 date_part('year', age(birth_date)) :: integer <= 24 then '18-24'
            when date_part('year', age(birth_date)) :: integer >= 25 and
                 date_part('year', age(birth_date)) :: integer <= 29 then '25-29'
            when date_part('year', age(birth_date)) :: integer >= 30 and
                 date_part('year', age(birth_date)) :: integer < 36 then '30-35'
            else '36+' end as group_age,
       count(user_id) as users_count
FROM   users
WHERE  birth_date is not null
GROUP BY group_age
ORDER BY group_age