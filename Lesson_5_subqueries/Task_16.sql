/*Из таблицы couriers выведите всю информацию о курьерах, которые в сентябре 2022 года доставили 30 и более заказов. Результат отсортируйте по возрастанию id курьера.

Поля в результирующей таблице: courier_id, birth_date, sex

Пояснение:

Обратите внимание, что информация о курьерах находится в таблице couriers, а информация о действиях с заказами — в таблице courier_actions.*/

with t1 as (SELECT courier_id,
                   count(order_id) as order_count
            FROM   courier_actions
            WHERE  action = 'deliver_order'
               and time >= '2022-09-01'
               and time <= '2022-10-01'
            GROUP BY courier_id)
SELECT *
FROM   couriers
WHERE  courier_id in (SELECT courier_id
                      FROM   t1
                      WHERE  order_count >= 30)