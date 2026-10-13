

create database SuperStore

use SuperStore

select * from [dbo].[Superstore Sales]

select * from [dbo].[Superstore Sales-Returns]

select * from [dbo].[users]

select * from [dbo].[Superstore Sales] left join [dbo].[Superstore Sales-Returns]
on [dbo].[Superstore Sales].Order_ID = [dbo].[Superstore Sales-Returns].Order_ID


SELECT 
    COALESCE(o.Order_ID, r.Order_ID) AS Order_ID
FROM [dbo].[Superstore Sales] AS o
LEFT JOIN [dbo].[Superstore Sales-Returns] AS r
    ON o.Order_ID = r.Order_ID;

select * from [dbo].[Superstore Sales] left join [dbo].[Superstore Sales-Returns]
on [dbo].[Superstore Sales].Order_ID = [dbo].[Superstore Sales-Returns].Order_ID

SELECT 
    COALESCE(o.Order_ID, r.Order_ID) AS Order_ID,
    o.Row_ID,
    o.Order_Date,
    o.Order_Priority,
    o.Order_Quantity,
    o.Sales,
    o.Discount,
    o.Ship_Mode,
    o.Profit,
    o.Unit_Price,
    o.Shipping_Cost,
    o.Customer_Name,
    o.City,
    o.Zip_Code,
    o.State,
    o.Region,
    o.Customer_Segment,
    o.Product_Category,
    o.Product_Sub_Category,
    o.Product_Name,
    o.Product_Container,
    o.Product_Base_Margin,
    o.Ship_Date,
    (o.Unit_Price * o.Order_Quantity) AS Total_Sales,
    CASE 
        WHEN r.Order_ID IS NOT NULL THEN 'Returned'
        ELSE 'Completed'
    END AS Order_Status
FROM [dbo].[Superstore Sales] AS o
LEFT JOIN [dbo].[Superstore Sales-Returns] AS r
    ON o.Order_ID = r.Order_ID;
go
CREATE VIEW vw_SalesRevenue AS
SELECT
 COALESCE(o.Order_ID, r.Order_ID) AS Order_ID,
    o.Row_ID,
    o.Order_Date,
    o.Order_Priority,
    o.Order_Quantity,
    o.Sales,
    o.Discount,
    o.Ship_Mode,
    o.Profit,
    o.Unit_Price,
    o.Shipping_Cost,
    o.Customer_Name,
    o.City,
    o.Zip_Code,
    o.State,
    o.Region,
    o.Customer_Segment,
    o.Product_Category,
    o.Product_Sub_Category,
    o.Product_Name,
    o.Product_Container,
    o.Product_Base_Margin,
    o.Ship_Date,
    (o.Unit_Price * o.Order_Quantity) AS Total_Sales,
    CASE 
        WHEN r.Order_ID IS NOT NULL THEN 'Returned'
        ELSE 'Completed'
    END AS Order_Status
FROM [dbo].[Superstore Sales] AS o
LEFT JOIN [dbo].[Superstore Sales-Returns] AS r
    ON o.Order_ID = r.Order_ID

SELECT * FROM vw_SalesRevenue;
