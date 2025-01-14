/*Повторите запрос из предыдущего задания, но теперь вместо подзапроса используйте оператор WITH и табличное выражение.

Условия задачи те же: используя данные из таблицы user_actions, рассчитайте среднее число заказов всех пользователей.

Полученное среднее число заказов округлите до двух знаков после запятой. Колонку с этим значением назовите orders_avg.

Поле в результирующей таблице: orders_avg*/

with t1 as (SELECT count(order_id) as orders,
                   user_id
            FROM   user_actions
            WHERE  action = 'create_order'
            GROUP BY user_id)
SELECT round(avg(orders), 2) as orders_avg
FROM   t1