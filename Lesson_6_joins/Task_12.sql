/*Для начала к таблице с заказами (orders) примените функцию unnest, как мы делали в прошлом уроке. Колонку с id товаров назовите product_id. Затем к образовавшейся расширенной таблице по ключу product_id добавьте информацию о ценах на товары (из таблицы products). Должна получиться таблица с заказами, товарами внутри каждого заказа и ценами на эти товары. Выведите колонки с id заказа, id товара и ценой товара. Результат отсортируйте сначала по возрастанию id заказа, затем по возрастанию id товара.

Добавьте в запрос оператор LIMIT и выведите только первые 1000 строк результирующей таблицы.

Поля в результирующей таблице: order_id, product_id, price

*/

SELECT
    order_id,
    t1.product_id AS product_id,
    price
FROM 
    (
    SELECT
        order_id,
        unnest(product_ids) AS product_id
    FROM orders
    ) AS t1
    LEFT JOIN products
        ON t1.product_id = products.product_id
ORDER BY order_id, product_id
LIMIT 1000