/*Отберите из таблицы users пользователей мужского пола, которые старше всех пользователей женского пола.

Выведите две колонки: id пользователя и дату рождения. Результат отсортируйте по возрастанию id пользователя.

Поля в результирующей таблице: user_id, birth_date*/

SELECT user_id,
       birth_date
FROM   users
WHERE  birth_date < (SELECT min(birth_date)
                     FROM   users
                     WHERE  sex = 'female')
   and sex = 'male'
ORDER BY user_id