/*К запросу, полученному на предыдущем шаге, примените оконную функцию и для каждого дня посчитайте долю первых и повторных заказов. Сохраните структуру полученной ранее таблицы и добавьте только одну новую колонку с посчитанными значениями.

Колонку с долей заказов каждой категории назовите orders_share. Значения в полученном столбце округлите до двух знаков после запятой. В результат также включите количество заказов в группах, посчитанное на предыдущем шаге.

В расчётах по-прежнему учитывайте только неотменённые заказы.

Результат отсортируйте сначала по возрастанию даты, затем по возрастанию значений в колонке с типом заказа.

Поля в результирующей таблице: date, order_type, orders_count, orders_share*/

SELECT user_id,
       order_id,
       action,
       time,
       created_orders,
       canceled_orders,
       round(cast(canceled_orders as decimal) / created_orders, 2) as cancel_rate
FROM   (SELECT user_id,
               order_id,
               action,
               time,
               count(order_id) filter (WHERE action = 'create_order') OVER(PARTITION BY user_id
                                                                           ORDER BY time) as created_orders,
               count(order_id) filter (WHERE action = 'cancel_order') OVER(PARTITION BY user_id
                                                                           ORDER BY time) as canceled_orders
        FROM   user_actions) as t1
ORDER BY user_id, order_id, time limit 1000