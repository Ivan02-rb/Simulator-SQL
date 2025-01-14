/*Используя запрос из предыдущего задания, рассчитайте суммарную стоимость каждого заказа. Выведите колонки с id заказов и их стоимостью. Колонку со стоимостью заказа назовите order_price. Результат отсортируйте по возрастанию id заказа.

Добавьте в запрос оператор LIMIT и выведите только первые 1000 строк результирующей таблицы.

Поля в результирующей таблице: order_id, order_price*/

WITH t1 AS
    (
    SELECT
        order_id,
        t2.product_id AS product_id,
        price
    FROM 
        (
        SELECT
            order_id,
            unnest(product_ids) AS product_id
        FROM orders
        ) AS t2
        LEFT JOIN products
            ON t2.product_id = products.product_id
    ORDER BY order_id, product_id
    )
SELECT
    order_id,
    SUM(price) AS order_price
FROM t1
GROUP BY order_id
ORDER BY order_id
LIMIT 1000