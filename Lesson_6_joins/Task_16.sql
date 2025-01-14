/*По таблицам courier_actions , orders и products определите 10 самых популярных товаров, доставленных в сентябре 2022 года.

Самыми популярными товарами будем считать те, которые встречались в заказах чаще всего. Если товар встречается в одном заказе несколько раз (было куплено несколько единиц товара), то при подсчёте учитываем только одну единицу товара.

Выведите наименования товаров и сколько раз они встречались в заказах. Новую колонку с количеством покупок товара назовите times_purchased. 

Поля в результирующей таблице: name, times_purchased*/

WITH t1 AS   
    (
    SELECT
        creation_time,
        t1.order_id AS order_id,
        time,
        time - creation_time AS DIFF_TIME
    FROM
        (
        SELECT
            order_id,
            courier_id,
            time,
            action
        FROM courier_actions
        WHERE action = 'deliver_order'
        ) AS t1
        LEFT JOIN orders
            ON t1.order_id = orders.order_id
    ORDER BY DIFF_TIME DESC
    LIMIT 10 
    )
SELECT
    order_id
FROM t1