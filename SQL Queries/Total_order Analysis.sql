SELECT * FROM coffeeshop;

SELECT COUNT(transaction_id) AS Total_Orders 
FROM coffeeshop
WHERE
MONTH(transaction_date) = 5; 

SELECT 
MONTH(transaction_date) AS month,
ROUND(COUNT(transaction_id)) AS total_orders,
(COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) 
OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id), 1) 
OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
coffeeshop
WHERE 
MONTH(transaction_date) IN (4, 5) -- for April and May
GROUP BY 
MONTH(transaction_date)
ORDER BY 
MONTH(transaction_date);


 