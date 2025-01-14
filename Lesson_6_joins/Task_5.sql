/*Возьмите запрос из задания 3, где вы объединяли таблицы user_actions и users с помощью LEFT JOIN, добавьте к запросу оператор WHERE и исключите NULL значения в колонке user_id из правой таблицы. Включите в результат все те же колонки и отсортируйте получившуюся таблицу по возрастанию id пользователя в колонке из левой таблицы.

Поля в результирующей таблице: user_id_left, user_id_right,  order_id, time, action, sex, birth_date*/

SELECT order_id,
       time,
       action,
       sex,
       birth_date,
       a.user_id as user_id_left,
       b.user_id as user_id_right
FROM   user_actions as a
    LEFT JOIN users as b
        ON a.user_id = b.user_id
WHERE  b.user_id is not null
ORDER BY a.user_id