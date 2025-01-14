/*Из таблицы couriers отберите id всех курьеров, родившихся в период с 1990 по 1995 год включительно.

Результат отсортируйте по возрастанию id курьера.

Поле в результирующей таблице: courier_id*/

SELECT courier_id
FROM   couriers
WHERE  birth_date between '1990-01-01'
   and '1996-01-01'
ORDER BY courier_id