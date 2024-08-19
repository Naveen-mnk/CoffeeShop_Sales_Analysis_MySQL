

SELECT store_location,
CONCAT(ROUND(SUM(transaction_qty * unit_price)/1000,2),"K") AS Total_Sales
FROM coffeeshop
WHERE
MONTH(transaction_date) = 6
GROUP BY
store_location
ORDER BY SUM(transaction_qty * unit_price) DESC;


