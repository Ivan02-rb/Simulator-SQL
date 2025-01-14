/*Выберите из таблицы products id и наименования только тех товаров, названия которых начинаются на букву «с» и содержат только одно слово.

Результат должен быть отсортирован по возрастанию id товара.

Поля в результирующей таблице: product_id, name

*/

SELECT product_id,
       split_part (name, ' ', 1) as name
FROM   products
WHERE  name like 'с%' = true
   and length(name) < 11
ORDER BY product_id