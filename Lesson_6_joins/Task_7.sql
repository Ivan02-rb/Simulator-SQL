/*Объедините два следующих запроса друг с другом так, чтобы на выходе получился набор уникальных дат из таблиц users и couriers:
SELECT birth_date
FROM users
WHERE birth_date IS NOT NULL


SELECT birth_date
FROM couriers
WHERE birth_date IS NOT NULL
Поместите в подзапрос полученный после объединения набор дат и посчитайте их количество. Колонку с числом дат назовите dates_count.

Поле в результирующей таблице: dates_count
*/

SELECT count(birth_date) as dates_count
FROM   (SELECT birth_date
        FROM   users
        WHERE  birth_date is not null
        UNION
SELECT birth_date
        FROM   couriers
        WHERE  birth_date is not null) as t1