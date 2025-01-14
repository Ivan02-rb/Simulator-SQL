/*Для каждого заказа, в котором больше 5 товаров, рассчитайте время, затраченное на его доставку. 

В результат включите id заказа, время принятия заказа курьером, время доставки заказа и время, затраченное на доставку. Новые колонки назовите соответственно time_accepted, time_delivered и delivery_time.

В расчётах учитывайте только неотменённые заказы. Время, затраченное на доставку, выразите в минутах, округлив значения до целого числа. Результат отсортируйте по возрастанию id заказа.

Поля в результирующей таблице: order_id, time_accepted, time_delivered и delivery_time*/

with t1 as (SELECT order_id
            FROM   orders
            WHERE  array_length(product_ids, 1) > 5)
SELECT min(time) as time_accepted,
       max(time) as time_delivered,
       order_id,
       round(date_part('minute', max(time) - min(time)) + (date_part('sec', max(time) - min(time)))/60)::integer as delivery_time
FROM   courier_actions
WHERE  order_id in (SELECT order_id
                    FROM   t1)
GROUP BY order_id having order_id not in (SELECT order_id
                                          FROM   user_actions
                                          WHERE  action = 'cancel_order')