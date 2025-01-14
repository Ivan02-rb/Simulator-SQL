/*Посчитайте количество созданных и отменённых заказов в таблице user_actions.

Новую колонку с числом заказов назовите orders_count.

Результат отсортируйте по числу заказов по возрастанию.

Поля в результирующей таблице: action, orders_count*/

SELECT action,
       count(order_id) as orders_count
FROM   user_actions
GROUP BY action