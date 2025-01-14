/*Используя функцию unnest, определите 10 самых популярных товаров в таблице orders.

Самыми популярными товарами будем считать те, которые встречались в заказах чаще всего. Если товар встречается в одном заказе несколько раз (когда было куплено несколько единиц товара), это тоже учитывается при подсчёте. Учитывайте только неотменённые заказы.

Выведите id товаров и то, сколько раз они встречались в заказах (то есть сколько раз были куплены). Новую колонку с количеством покупок товаров назовите times_purchased.

Результат отсортируйте по возрастанию id товара.

Поля в результирующей таблице: product_id, times_purchased*/

with t1 as (SELECT count(order_id) as times_purchased,
                   unnest(product_ids) as product_id
            FROM   orders
            WHERE  order_id not in (SELECT order_id
                                    FROM   user_actions
                                    WHERE  action = 'cancel_order')
            GROUP BY unnest(product_ids)
            ORDER BY count(order_id) desc limit 10)
SELECT times_purchased,
       product_id
FROM   t1
ORDER BY product_id