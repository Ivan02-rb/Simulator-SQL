/*Посчитайте количество всех значений в колонке user_id в таблице user_actions, а также количество уникальных значений в этой колонке (т.е. количество уникальных пользователей сервиса).

Колонку с первым полученным значением назовите users, а колонку со вторым — unique_users.

Поля в результирующей таблице: users, unique_users*/

SELECT count(user_id) as users,
       count(distinct user_id) as unique_users
FROM   user_actions