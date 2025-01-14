/*Для начала объедините таблицы user_actions и orders — это вы уже умеете делать. В качестве ключа используйте поле order_id. Выведите id пользователей и заказов, а также список товаров в заказе. Отсортируйте таблицу по id пользователя по возрастанию, затем по id заказа — тоже по возрастанию.

Добавьте в запрос оператор LIMIT и выведите только первые 1000 строк результирующей таблицы.

Поля в результирующей таблице: user_id, order_id, product_ids*/

SELECT user_id,
       a.order_id,
       product_ids
FROM   user_actions a join orders b
        ON a.order_id = b.order_id
ORDER BY user_id, order_id limit 1000