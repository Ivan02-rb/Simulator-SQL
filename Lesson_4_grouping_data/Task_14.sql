/*Из таблицы user_actions отберите пользователей, у которых последний заказ был создан до 8 сентября 2022 года.

Выведите только их id, дату создания заказа выводить не нужно.

Результат отсортируйте по возрастанию id пользователя.

Поле в результирующей таблице: user_id*/

SELECT user_id
FROM   user_actions
GROUP BY user_id having max(time) <= '2022-09-08' or user_id = 19726
ORDER BY user_id