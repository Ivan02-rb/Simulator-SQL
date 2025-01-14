SELECT name,
       price,
       cast(price as varchar) as price_char
FROM   products
ORDER BY name