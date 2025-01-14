/*Рассчитайте среднее количество товаров в заказах из таблицы orders, которые пользователи оформляли по выходным дням (суббота и воскресенье) в течение всего времени работы сервиса.

Полученное значение округлите до двух знаков после запятой. Колонку с ним назовите avg_order_size.

Поле в результирующей таблице: avg_order_size*/

SELECT round(avg(array_length(product_ids, 1)), 2) as avg_order_size
FROM   orders
WHERE  date_part('dow', creation_time) = 0
    or date_part('dow', creation_time) = 6