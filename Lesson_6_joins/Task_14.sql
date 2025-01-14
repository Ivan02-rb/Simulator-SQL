/*Объедините запрос из предыдущего задания с частью запроса, который вы составили в задаче 11, то есть объедините запрос со стоимостью заказов с запросом, в котором вы считали размер каждого заказа из таблицы user_actions.

На основе объединённой таблицы для каждого пользователя рассчитайте следующие показатели:

общее число заказов — колонку назовите orders_count
среднее количество товаров в заказе — avg_order_size
суммарную стоимость всех покупок — sum_order_value
среднюю стоимость заказа — avg_order_value
минимальную стоимость заказа — min_order_value
максимальную стоимость заказа — max_order_value
Полученный результат отсортируйте по возрастанию id пользователя.

Добавьте в запрос оператор LIMIT и выведите только первые 1000 строк результирующей таблицы.

Помните, что в расчётах мы по-прежнему учитываем только неотменённые заказы. При расчёте средних значений, округляйте их до двух знаков после запятой.

Поля в результирующей таблице: 

user_id, orders_count, avg_order_size, sum_order_value, avg_order_value, min_order_value, max_order_value*/

WITH users_orders AS   
    (SELECT
            user_id,
            user_actions.order_id AS order_id,
            product_ids
        FROM user_actions
            LEFT JOIN orders
            ON user_actions.order_id = orders.order_id
        WHERE user_actions.order_id NOT IN 
                                        (
                                        SELECT
                                            order_id
                                        FROM user_actions
                                        WHERE action = 'cancel_order'
                                        )
        ORDER BY user_id, order_id )


SELECT
    user_id,
    COUNT(order_id) AS orders_count,
    ROUND(AVG(array_length(product_ids, 1)), 2) AS avg_order_size,
    SUM(order_price) AS sum_order_value,
    ROUND(AVG(order_price), 2) AS avg_order_value,
    MIN(order_price) AS min_order_value,
    MAX(order_price) AS max_order_value
FROM
    (
        SELECT 
            user_id,
            users_orders.order_id AS order_id,
            product_ids,
            order_price
        FROM users_orders
            LEFT JOIN 
                (
                    WITH t2 AS
            (
                SELECT
                    order_id,
                    t1.product_id AS product_id,
                    price
                FROM 
                    (
                    SELECT
                        order_id,
                        unnest(product_ids) AS product_id
                    FROM orders
                    ) AS t1
                    LEFT JOIN products
                        ON t1.product_id = products.product_id
                ORDER BY order_id, product_id
                )
            SELECT
                order_id,
                SUM(price) AS order_price
            FROM t2
            GROUP BY order_id
            ORDER BY order_id
                ) AS t3
                ON users_orders.order_id = t3.order_id
    ) AS joins_tables
GROUP BY user_id
ORDER BY user_id
LIMIT 1000