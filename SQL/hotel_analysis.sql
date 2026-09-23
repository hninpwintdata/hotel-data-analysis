-- HOTEL SALES SQL ANALYSIS

USE hotel_portfolio;


-- Q1. Total Bookings
SELECT COUNT(*) AS Total_Bookings
FROM hotel_sales;

-- Result: 500


-- Q2. Total Revenue
SELECT SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales;

-- Result: ¥33,998,000


-- Q3. Average Revenue per Booking
SELECT AVG(Total_Revenue) AS Avg_Revenue_Per_Booking
FROM hotel_sales;

-- Result: ¥67,996

-- Q4. Total Revenue by Room Type
SELECT
    Room_Type,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY Room_Type;

-- Result:
-- Deluxe: ¥12,852,500
-- Standard: ¥12,376,000
-- Suite: ¥8,769,500

-- Q5. Number of Bookings by Room Type
SELECT
    Room_Type,
    COUNT(Booking_ID) AS Booking_Count
FROM hotel_sales
GROUP BY Room_Type;

-- Result:
-- Deluxe: 178
-- Standard: 249
-- Suite: 73

-- Q6. Average Revenue by Room Type
SELECT
    Room_Type,
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
GROUP BY Room_Type;

-- Result:
-- Deluxe: ¥72,205.06
-- Standard: ¥49,702.81
-- Suite: ¥120,130.14

-- Q7. Total Restaurant Spend by Room Type
SELECT
    Room_Type,
    SUM(Restaurant_Spend) AS Restaurant_Revenue
FROM hotel_sales
GROUP BY Room_Type;

-- Result:
-- Deluxe: ¥1,175,500
-- Standard: ¥1,649,000
-- Suite: ¥484,500

-- Q8. Total Revenue by Booking Channel
SELECT
    Booking_Channel,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY Booking_Channel;

-- Result:
-- Online: ¥17,573,500
-- Travel Agent: ¥8,288,000
-- Direct: ¥8,136,500

-- Q9. Number of Bookings by Booking Channel
SELECT
    Booking_Channel,
    COUNT(Booking_ID) AS Booking_Counts
FROM hotel_sales
GROUP BY Booking_Channel;

-- Result:
-- Online: 251
-- Direct: 125
-- Travel Agent: 124


-- Q10. Average Revenue by Booking Channel
SELECT
    Booking_Channel,
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
GROUP BY Booking_Channel;

-- Result:
-- Online: ¥70,013.94
-- Direct: ¥65,092.00
-- Travel Agent: ¥66,838.71

-- Q11. Total Revenue by Customer Type
SELECT
    Customer_Type,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY Customer_Type;

-- Result:
-- Returning: ¥11,825,000
-- New: ¥22,173,000

-- Q12. Number of Bookings by Customer Type
SELECT
    Customer_Type,
    COUNT(Booking_ID) AS Booking_Count
FROM hotel_sales
GROUP BY Customer_Type;

-- Result:
-- Returning: 172
-- New: 328

-- Q13. Average Revenue by Customer Type
SELECT
    Customer_Type,
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
GROUP BY Customer_Type;

-- Result:
-- Returning: ¥68,750.00
-- New: ¥67,600.61


-- Q14. Highest Revenue Booking
SELECT
    Booking_ID,
    Total_Revenue
FROM hotel_sales
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Result:
-- B0218: ¥230,500

-- Q15. Lowest Revenue Booking
SELECT
    Booking_ID,
    Total_Revenue
FROM hotel_sales
ORDER BY Total_Revenue ASC
LIMIT 1;

-- Result:
-- B0298: ¥11,000

-- Q16. Top 5 Highest Revenue Bookings
SELECT
    Booking_ID,
    Total_Revenue
FROM hotel_sales
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Q17. Top 5 Lowest Revenue Bookings
SELECT
    Booking_ID,
    Total_Revenue
FROM hotel_sales
ORDER BY Total_Revenue ASC
LIMIT 5;

-- Q18. Room Type with Highest Average Revenue
SELECT
    Room_Type,
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
GROUP BY Room_Type
ORDER BY Avg_Revenue DESC
LIMIT 1;

-- Result:
-- Suite: ¥120,130.14

-- Q19. Booking Channel with Highest Average Revenue
SELECT
    Booking_Channel,
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
GROUP BY Booking_Channel
ORDER BY Avg_Revenue DESC
LIMIT 1;

-- Result:
-- Online: ¥70,013.94

-- Q20. Customer Type with Highest Restaurant Spend
SELECT
    Customer_Type,
    SUM(Restaurant_Spend) AS Total_Restaurant_Spend
FROM hotel_sales
GROUP BY Customer_Type
ORDER BY Total_Restaurant_Spend DESC
LIMIT 1;

-- Result:
-- New: ¥2,118,000


-- Q21. Room Type with Highest Average Restaurant Spend
SELECT
    Room_Type,
    AVG(Restaurant_Spend) AS Avg_Restaurant_Spend
FROM hotel_sales
GROUP BY Room_Type
ORDER BY Avg_Restaurant_Spend DESC
LIMIT 1;

-- Result:
-- Suite: ¥6,636.99

-- Q22. Bookings with Revenue Above ¥100,000
SELECT
    COUNT(Booking_ID) AS Booking_Count
FROM hotel_sales
WHERE Total_Revenue > 100000;

-- Result:
-- 90 bookings

-- Q23. Online Booking Count
SELECT
    COUNT(Booking_ID) AS Booking_Count
FROM hotel_sales
WHERE Booking_Channel = 'Online';

-- Result:
-- 251 bookings

-- Q24. Online Channel Revenue
SELECT
    COUNT(Booking_ID) AS Booking_Count,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
WHERE Booking_Channel = 'Online';

-- Result:
-- 251 bookings
-- ¥17,573,500 total revenue
-- Q25. Average Revenue of High-Value Bookings
SELECT
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
WHERE Total_Revenue > 100000;

-- Result:
-- ¥139,961.11

-- Q26. Room Types with More Than 100 Bookings
SELECT
    Room_Type,
    COUNT(Booking_ID) AS Booking_Counts
FROM hotel_sales
GROUP BY Room_Type
HAVING Booking_Counts > 100;

-- Result:
-- Deluxe: 178
-- Standard: 249
-- Q27. Booking Channels with Revenue Above ¥8,000,000
SELECT
    Booking_Channel,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY Booking_Channel
HAVING Total_Revenue > 8000000;

-- Result:
-- Online: ¥17,573,500
-- Direct: ¥8,136,500
-- Travel Agent: ¥8,288,000

-- Q28. Customer Types with Average Revenue > ¥68,000
SELECT
    Customer_Type,
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
GROUP BY Customer_Type
HAVING Avg_Revenue > 68000;

-- Result: Returning | ¥68,750

-- Q29. Monthly Revenue
SELECT
    DATE_FORMAT(Booking_Date, '%Y-%m') AS Month,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY DATE_FORMAT(Booking_Date, '%Y-%m');

-- Result: 12 months

-- Q30. Monthly Revenue Ranked Highest to Lowest
SELECT
    DATE_FORMAT(Booking_Date, '%m') AS Month,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY DATE_FORMAT(Booking_Date, '%m')
ORDER BY Total_Revenue DESC;

-- Q31. Bookings Above Average Revenue
SELECT
    Booking_ID,
    Total_Revenue
FROM hotel_sales
WHERE Total_Revenue > (
    SELECT AVG(Total_Revenue)
    FROM hotel_sales
);

-- Result: 191 bookings
-- Overall average revenue: ¥67,996

-- Q32. Room Types Above Overall Average Revenue
SELECT
    Room_Type,
    AVG(Total_Revenue) AS Avg_Revenue
FROM hotel_sales
GROUP BY Room_Type
HAVING Avg_Revenue > (
    SELECT AVG(Total_Revenue)
    FROM hotel_sales
);

-- Result: Deluxe, Suite

-- Q33. Total Revenue by City
SELECT
    City,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY City
ORDER BY Total_Revenue DESC;

-- Q34. Average Revenue per Guest by Room Type

SELECT
    Room_Type,
    AVG(Total_Revenue / Guests) AS Avg_Revenue_Per_Guest
FROM hotel_sales
GROUP BY Room_Type;

-- Q35. Revenue by Customer Type and Booking Channel

SELECT
    Customer_Type,
    Booking_Channel,
    SUM(Total_Revenue) AS Total_Revenue
FROM hotel_sales
GROUP BY Customer_Type, Booking_Channel;



