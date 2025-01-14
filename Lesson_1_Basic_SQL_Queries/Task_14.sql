SELECT product_id,
       name,
       price as old_price,
       case when (name != 'икра') and
                 price > 100 then price * 1.05
            else price end as new_price
FROM   products
ORDER BY new_price desc, product_id