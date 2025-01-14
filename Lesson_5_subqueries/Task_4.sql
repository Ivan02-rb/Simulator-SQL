/*Выведите информацию о товарах в таблице products, цена на которые превышает среднюю цену всех товаров на 20 рублей и более. Результат отсортируйте по убыванию id товара.

Поля в результирующей таблице: product_id, name, price*/

with t1 as (SELECT avg(price)
            FROM   products)
SELECT product_id,
       name,
       price
FROM   products
WHERE  price >= (SELECT *
                 FROM   t1) + 20
ORDER BY product_id desc