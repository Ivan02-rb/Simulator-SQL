/*Выясните, есть ли в таблице courier_actions такие заказы, которые были приняты курьерами, но не были созданы пользователями. Посчитайте количество таких заказов.

Колонку с числом заказов назовите orders_count.

Поле в результирующей таблице: orders_count*/

with t1 as (SELECT order_id
            FROM   user_actions
            WHERE  action != 'create_order'
               and action != 'cancel_order')
SELECT count(order_id) as orders_count
FROM   courier_actions
WHERE  action = 'accept_order'
   and order_id = (SELECT *
                FROM   t1)