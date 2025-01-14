/*Посчитайте максимальную и минимальную цены товаров в таблице products. Поля назовите соответственно max_price, min_price.

Поля в результирующей таблице: max_price, min_price*/

SELECT max(price) as max_price,
       min(price) as min_price
FROM   products