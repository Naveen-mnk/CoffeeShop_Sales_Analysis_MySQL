
SELECT CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN "Weekends"
ELSE "Weekdays"
END AS day_type,
CONCAT(ROUND(SUM( unit_price * transaction_qty)/1000,1),"k") AS Total_Sales
FROM coffeeshop
WHERE MONTH(transaction_date) = 2
GROUP BY
CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN "Weekends"
ELSE "Weekdays"
END
