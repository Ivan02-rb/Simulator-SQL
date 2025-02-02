/*Теперь снова попробуйте немного переписать запрос из прошлого задания и посчитайте количество уникальных id в колонке user_id, пришедшей из левой таблицы user_actions. Выведите это количество в качестве результата. Колонку с посчитанным значением назовите users_count.

Поле в результирующей таблице: users_count*/

SELECT count(distinct a.user_id) as users_count
FROM   user_actions as a
    LEFT JOIN users as b
        ON a.user_id = b.user_id