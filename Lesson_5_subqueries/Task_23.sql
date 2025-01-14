/*Из таблицы orders выведите id и содержимое заказов, которые включают хотя бы один из пяти самых дорогих товаров, доступных в нашем сервисе.

Результат отсортируйте по возрастанию id заказа.

Поля в результирующей таблице: order_id, product_ids*/

with t1 as (SELECT order_id,
                   product_ids,
                   unnest(product_ids) as product_id
            FROM   orders)
SELECT DISTINCT order_id,
                product_ids
FROM   t1
WHERE  product_id in (SELECT product_id
                      FROM   products
                      ORDER BY price desc limit 5)
ORDER BY order_id