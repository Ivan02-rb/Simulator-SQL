/*Определите количество отменённых заказов в таблице courier_actions и выясните, есть ли в этой таблице такие заказы, которые были отменены пользователями, но при этом всё равно были доставлены. Посчитайте количество таких заказов.

Колонку с отменёнными заказами назовите orders_canceled. Колонку с отменёнными, но доставленными заказами назовите orders_canceled_and_delivered. 

Поля в результирующей таблице: orders_canceled, orders_canceled_and_delivered

*/

SELECT count(order_id) filter (WHERE action = 'cancel_order') as orders_canceled,
       (SELECT count(order_id) filter (WHERE action = 'deliver_order')
 FROM   courier_actions
 WHERE  order_id in (SELECT order_id
                     FROM   user_actions
                     WHERE  action = 'cancel_order')) as orders_canceled_and_delivered
FROM   user_actions