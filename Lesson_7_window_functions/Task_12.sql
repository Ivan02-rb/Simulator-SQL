/*Примените оконную функцию к таблице products и с помощью агрегирующей функции в отдельной колонке для каждой записи проставьте среднюю цену всех товаров. Колонку с этим значением назовите avg_price.

Затем с помощью оконной функции и оператора FILTER в отдельной колонке рассчитайте среднюю цену товаров без учёта самого дорогого. Колонку с этим средним значением назовите avg_price_filtered. Полученные средние значения в колонках avg_price и avg_price_filtered округлите до двух знаков после запятой.

Выведите всю информацию о товарах, включая значения в новых колонках. Результат отсортируйте сначала по убыванию цены товара, затем по возрастанию id товара.

Поля в результирующей таблице: product_id, name, price, avg_price, avg_price_filtered

*/

with t1 as (SELECT courier_id,
                       action,
                       time,
                       rank() OVER(PARTITION BY courier_id
                                   ORDER BY time rows between 1 preceding and 1 preceding) as rankk,
                       count(order_id) filter (WHERE action = 'deliver_order') OVER(PARTITION BY courier_id) as orders_count
                FROM   courier_actions
                ORDER BY time)
SELECT courier_id,
       days_employed,
       orders_count as delivered_orders
FROM   (SELECT courier_id,
               action,
               date_part('days', age((SELECT max(time)
                               FROM   courier_actions), time)) :: integer as days_employed, rankk, orders_count
        FROM   t1
        WHERE  rankk = 1) as t2
WHERE  days_employed >= 10
ORDER BY days_employed desc, courier_id