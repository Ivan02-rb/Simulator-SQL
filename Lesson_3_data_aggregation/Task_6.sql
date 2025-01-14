/*Посчитайте количество курьеров женского пола в таблице couriers. Полученный столбец с одним значением назовите couriers.

Поле в результирующей таблице: couriers*/

SELECT count(sex) as couriers
FROM   couriers
WHERE  sex = 'female'