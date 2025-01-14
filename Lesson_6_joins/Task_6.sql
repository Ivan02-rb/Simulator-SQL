/*С помощью FULL JOIN объедините по ключу birth_date таблицы, полученные в результате вышеуказанных запросов (то есть объедините друг с другом два подзапроса). Не нужно изменять их, просто добавьте нужный JOIN.

В результат включите две колонки с birth_date из обеих таблиц. Эти две колонки назовите соответственно users_birth_date и couriers_birth_date. Также включите в результат колонки с числом пользователей и курьеров — users_count и couriers_count.

Отсортируйте получившуюся таблицу сначала по колонке users_birth_date по возрастанию, затем по колонке couriers_birth_date — тоже по возрастанию.

Поля в результирующей таблице: users_birth_date, users_count,  couriers_birth_date, couriers_count*/

SELECT t1.birth_date as users_birth_date,
       t1.users_count as users_count,
       t2.birth_date as couriers_birth_date,
       t2.couriers_count as couriers_count
FROM   (SELECT birth_date,
               count(user_id) as users_count
        FROM   users
        WHERE  birth_date is not null
        GROUP BY birth_date) as t1 full join (SELECT birth_date,
                                             count(courier_id) as couriers_count
                                      FROM   couriers
                                      WHERE  birth_date is not null
                                      GROUP BY birth_date) as t2
        ON t1.birth_date = t2.birth_date
ORDER BY users_birth_date, couriers_birth_date