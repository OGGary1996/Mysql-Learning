-- 在进行运算时，有些records可能会是NULL，可以使用IFNULL(),ISNULL(),COALESCE()来决定替换NULL进行计算的值
SELECT 
	product_id,
    name AS product,
    IFNULL(quantity_in_stock,0) * IFNULL(unit_price,0) AS 'Total price in stock' -- quantity_in_stock和unit_price可能有NULL，可替换NULL值为其他的值
FROM products;

SELECT 
	product_id,
    name AS product,
    ISNULL(quantity_in_stock,0) * ISNULL(unit_price,0) AS 'Total price in stock' -- quantity_in_stock和unit_price可能有NULL，可替换NULL值为其他的值
FROM products;

SELECT 
	product_id,
    name AS product,
    COALESCE(quantity_in_stock,0) * COALESCE(unit_price,0) AS 'Total price in stock' -- quantity_in_stock和unit_price可能有NULL，可替换NULL值为其他的值
FROM products;