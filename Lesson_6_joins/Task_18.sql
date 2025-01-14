/*По таблицам orders и courier_actions определите id десяти заказов, которые доставляли дольше всего.

Поле в результирующей таблице: order_id*/

WITH join_orders_and_courier_actions AS
(
SELECT
    courier_id,
    courier_actions.order_id AS order_id,
    product_ids,
    action,
    length_order
FROM courier_actions
    LEFT JOIN
        (SELECT
            order_id,
            product_ids,
            array_length(product_ids, 1) AS length_order
        FROM orders ) AS t1
        ON  courier_actions.order_id = t1.order_id
WHERE action = 'deliver_order'
)

SELECT
    order_id,
    user_id,
    CAST(DATE_PART('year', AGE((SELECT MAX(time) FROM user_actions), users_birth_date)) AS INTEGER) AS user_age,
    courier_id,
    CAST(DATE_PART('year', AGE((SELECT MAX(time) FROM user_actions), couriers_birth_date)) AS INTEGER) AS courier_age
FROM
    (
    SELECT
        couriers.birth_date AS couriers_birth_date,
        users_birth_date,
        t2.user_id AS user_id,
        t2.courier_id AS courier_id,
        order_id,
        length_order
    FROM
        (
        SELECT
            users.birth_date AS users_birth_date,
            t3.user_id AS user_id,
            courier_id,
            order_id,
            length_order
        FROM
            (
            SELECT
                user_id,
                courier_id,
                l.order_id AS order_id,
                length_order
            FROM join_orders_and_courier_actions AS l
                LEFT JOIN user_actions AS r
                    ON l.order_id = r.order_id
            ) AS t3
        LEFT JOIN users
            ON t3.user_id = users.user_id
        ) AS t2
            LEFT JOIN couriers
                ON t2.courier_id = couriers.courier_id
    ) AS t4
WHERE length_order IN (SELECT
                        MAX(array_length(product_ids, 1))
                       FROM orders)
ORDER BY order_id