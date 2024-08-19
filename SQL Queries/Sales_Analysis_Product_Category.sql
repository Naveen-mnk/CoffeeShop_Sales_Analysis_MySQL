

SELECT 
product_category,
SUM(transaction_qty * unit_price) AS Total_Sales
FROM coffeeshop
WHERE MONTH(transaction_date)  = 5
GROUP BY(product_category)
ORDER BY(SUM(transaction_qty * unit_price)) DESC;