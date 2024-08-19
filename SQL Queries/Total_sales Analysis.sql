
SELECT CONCAT((ROUND(SUM(unit_price * transaction_qty)))/1000, 'K') AS Total_Sales
FROM coffeeshop 
WHERE
MONTH(transaction_date) =  3; -- March month

SELECT 
MONTH(transaction_date) as month, -- number of moth
ROUND(SUM(transaction_qty * unit_price )) AS Total_Sales, -- total sales column
(SUM(transaction_qty * unit_price )  - LAG(SUM(transaction_qty * unit_price ),1) -- month sales difference
OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty * unit_price ),1) -- division by previous month
OVER (ORDER BY MONTH(transaction_date)) * 100 AS mon_increase_percentage -- percentage

FROM coffeeshop
WHERE
MONTH(transaction_date) IN (4,5) -- FOR MONTHS OF APRIL(PRE) AND MAY(CUR)
GROUP BY 
MONTH(transaction_date)
ORDER BY
MONTH(transaction_date);

