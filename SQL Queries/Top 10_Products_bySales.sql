
SELECT 
product_type,
SUM(transaction_qty * unit_price) AS Total_Sales
FROM coffeeshop
WHERE MONTH(transaction_date)  = 5 AND product_category = "coffee"
GROUP BY(product_type)
ORDER BY(SUM(transaction_qty * unit_price)) DESC
LIMIT 10;