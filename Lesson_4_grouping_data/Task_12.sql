/*По данным из таблицы user_actions определите пять пользователей, сделавших в августе 2022 года наибольшее количество заказов.

Выведите две колонки — id пользователей и число оформленных ими заказов. Колонку с числом оформленных заказов назовите created_orders.

Результат отсортируйте сначала по убыванию числа заказов, сделанных пятью пользователями, затем по возрастанию id этих пользователей.

Поля в результирующей таблице: user_id, created_orders*/

SELECT count(order_id) as created_orders,
       user_id
FROM   user_actions
WHERE  time between '2022-08-01'
   and '2022-09-01'
   and action = 'create_order'
GROUP BY user_id
ORDER BY created_orders desc, user_id limit 5