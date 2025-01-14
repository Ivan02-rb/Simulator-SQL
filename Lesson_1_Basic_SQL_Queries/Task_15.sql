SELECT product_id,
       name,
       price,
       round(price / 120 * 20, 2) as tax,
       round(price - (price / 120 * 20), 2) as price_before_tax
FROM   products
ORDER BY price_before_tax desc, product_id