/*С помощью оператора GROUP BY посчитайте количество курьеров мужского и женского пола в таблице couriers.

Новую колонку с числом курьеров назовите couriers_count.

Результат отсортируйте по этой колонке по возрастанию.

Поля в результирующей таблице: sex, couriers_count*/

SELECT sex,
       count(courier_id) as couriers_count
FROM   couriers
GROUP BY sex
ORDER BY couriers_count