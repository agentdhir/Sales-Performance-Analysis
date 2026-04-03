USE sales_project;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Desktop/Superstore.csv'
INTO TABLE superstore
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM superstore LIMIT 10;
Select Region,
	SUM(SALES) AS total_sales,
	SUM(PROFIT) AS total_profit,
    SUM(PROFIT)/SUM(SALES) AS profit_margin
FROM superstore
GROUP BY Region;

SELECT 
    Region,
    SUM(Sales),
    SUM(Profit)
FROM superstore
GROUP BY Region;

SELECT Category,
	SUM(SALES) AS total_sales,
    SUM(PROFIT) AS total_profit,
    SUM(PROFIT)/SUM(SALES) AS profit_margin
FROM superstore
GROUP BY Category;

SELECT Sub_Category,
	SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
group by Sub_Category
ORDER BY total_profit ASC;

SELECT
	CASE 
		When Discount < 0.1 Then '0-10%'
		When Discount < 0.2 Then '10-20%'
		When Discount < 0.3 Then '20-30%'
		When Discount < 0.4 Then '30-40%'
        else '40%+'
	END AS discount_range,
    SUM(PROFIT) AS total_profit
FROM superstore
group by discount_range
order by discount_range;


Select 
	case 
		when discount < 0.1 then '0-10%'
		when discount < 0.2then '10-20%'
		when discount < 0.3then '20-30%'
		when discount < 0.4then '30-40%'
        else '40%+'
	end as discount_range,
    sum(profit) as total_profit
from superstore
group by category , discount_range
order by category , discount_range;

select 
	sub_category,
    discount,
    profit
from superstore
where Sub_Category = 'Tables'
order by Discount desc
        
        
        
    
		

