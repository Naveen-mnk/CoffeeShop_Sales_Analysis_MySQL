

SELECT 
CONCAT(ROUND(AVG(Total_Sales)/1000,1),"K") as Average_Sales
FROM (
	 SELECT SUM(transaction_qty * unit_price) AS Total_Sales
    FROM coffeeshop
    WHERE MONTH(transaction_date) = 5
    GROUP BY transaction_date ) AS internal_Query;
    
    SELECT 
    DAY(transaction_date) AS Day_of_Month,
    SUM(transaction_qty *unit_price) AS Totlal_Sales
    FROM coffeeshop 
    WHERE MONTH(transaction_date)  = 5
    GROUP BY(DAY(transaction_date))
    ORDER BY(DAY(transaction_date));
    
    SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffeeshop
    WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        DAY(transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;