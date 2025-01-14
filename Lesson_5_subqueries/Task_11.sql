/*Выясните, есть ли в таблице courier_actions такие заказы, которые были приняты курьерами, но не были доставлены пользователям. Посчитайте количество таких заказов.

Колонку с числом заказов назовите orders_count.

Поле в результирующей таблице: orders_count*/

SELECT count(order_id) as orders_count
FROM   courier_actions
WHERE  action = 'accept_order'
   and order_id not in (SELECT order_id
                     FROM   courier_actions
                     WHERE  action = 'deliver_order')