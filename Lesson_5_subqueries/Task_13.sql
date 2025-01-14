/*По таблицам courier_actions и user_actions снова определите число недоставленных заказов и среди них посчитайте количество отменённых заказов и количество заказов, которые не были отменены (и соответственно, пока ещё не были доставлены).

Колонку с недоставленными заказами назовите orders_undelivered, колонку с отменёнными заказами назовите orders_canceled, колонку с заказами «в пути» назовите orders_in_process.

Поля в результирующей таблице: orders_undelivered, orders_canceled, orders_in_process*/

with t1 as (SELECT order_id
            FROM   courier_actions
            WHERE  order_id not in (SELECT order_id
                                    FROM   courier_actions
                                    WHERE  action = 'deliver_order'))
SELECT count(order_id) as orders_undelivered,
       count(order_id) filter (WHERE order_id in (SELECT order_id
                                           FROM   user_actions
                                           WHERE  action = 'cancel_order')) as orders_canceled, count(order_id) filter (
WHERE  order_id not in (SELECT order_id
                        FROM   user_actions
                        WHERE  action = 'cancel_order')) as orders_in_process
FROM   t1