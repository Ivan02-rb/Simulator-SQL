/*С помощью LEFT JOIN объедините таблицы user_actions и users по ключу user_id. Обратите внимание на порядок таблиц — слева users_actions, справа users. В результат включите две колонки с user_id из обеих таблиц. Эти две колонки назовите соответственно user_id_left и user_id_right. Также в результат включите колонки order_id, time, action, sex, birth_date. Отсортируйте получившуюся таблицу по возрастанию id пользователя (в колонке из левой таблицы).

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
ORDER BY a.user_id