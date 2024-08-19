
SELECT 
CONCAT(ROUND(SUM(transaction_qty * unit_price)/1000,1), "K") AS Total_Sales,
CONCAT(ROUND(SUM(transaction_qty)/1000,1),"K") AS Total_Quantity_Sold,
CONCAT(ROUND(COUNT(transaction_id)/1000,1), "K") AS Total_Orders
FROM coffeeshop
WHERE transaction_date = '2023-03-27';