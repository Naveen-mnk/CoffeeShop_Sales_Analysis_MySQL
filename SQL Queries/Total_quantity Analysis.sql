
SELECT * FROM coffeeshop;

SELECT SUM(transaction_qty) AS Total_Quantity
FROM coffeeshop
WHERE
MONTH(transaction_date) = 6; 

SELECT
MONTH(transaction_date) AS month,
ROUND(SUM(transaction_qty)) AS total_quantity_sold,
(SUM(transaction_qty) - LAG(SUM(transaction_qty), 1) 
OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1) 
OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM coffeeshop
WHERE 
MONTH(transaction_date) IN (4, 5)   -- for April and May
GROUP BY 
MONTH(transaction_date)
ORDER BY 
MONTH(transaction_date);

