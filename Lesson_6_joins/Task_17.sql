/*Возьмите запрос, составленный на одном из прошлых уроков, и подтяните в него из таблицы users данные о поле пользователей таким образом, чтобы все пользователи из таблицы user_actions остались в результате. Затем посчитайте среднее значение cancel_rate для каждого пола, округлив его до трёх знаков после запятой. Колонку с посчитанным средним значением назовите avg_cancel_rate.

Помните про отсутствие информации о поле некоторых пользователей после join, так как не все пользователи из таблицы user_action есть в таблице users. Для этой группы тоже посчитайте cancel_rate и в результирующей таблице для пустого значения в колонке с полом укажите ‘unknown’ (без кавычек). Возможно, для этого придётся вспомнить, как работает COALESCE.

Результат отсортируйте по колонке с полом пользователя по возрастанию.

Поля в результирующей таблице: sex, avg_cancel_rate

*/

WITH t1 AS
    (
    SELECT
        t2.product_id AS product_id,
        product_ids,
        t2.order_id AS order_id,
        name
    FROM 
        (
        SELECT
            product_ids,
            order_id,
            unnest(product_ids) AS product_id
        FROM orders
        ) AS t2
        LEFT JOIN products 
            ON t2.product_id = products.product_id
    )

SELECT
    order_id,
    array_agg(name) AS product_names
FROM t1
GROUP BY order_id
LIMIT 1000