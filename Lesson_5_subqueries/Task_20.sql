/*Для каждой даты в таблице user_actions посчитайте количество первых заказов, совершённых пользователями.

Первыми заказами будем считать заказы, которые пользователи сделали в нашем сервисе впервые. В расчётах учитывайте только неотменённые заказы.

В результат включите две колонки: дату и количество первых заказов в эту дату. Колонку с датами назовите date, а колонку с первыми заказами — first_orders.

Результат отсортируйте по возрастанию даты.

Поля в результирующей таблице: date, first_orders*/

with t1 as (SELECT user_id,
                   date(min(time)) as date
            FROM   user_actions
            WHERE  order_id not in (SELECT order_id
                                    FROM   user_actions
                                    WHERE  action = 'cancel_order')
            GROUP BY user_id)
SELECT count(user_id) as first_orders,
       date
FROM   t1
GROUP BY date
ORDER BY date