use pizzeria;

SELECT ci.name AS city, SUM(op.quantity) AS total_drinks_sold
FROM Orders o
JOIN Customers c ON o.customer_id = c.id
JOIN Cities ci ON c.city_id = ci.id
JOIN Order_Products op ON o.id = op.order_id
JOIN Products p ON op.product_id = p.id
JOIN Categories cat ON p.category_id = cat.id
WHERE cat.name = 'Drinks' AND ci.name = 'Mataró'
GROUP BY ci.name;

SELECT e.first_name, e.last_name, COUNT(o.id) AS total_deliveries
FROM Employees e
JOIN Orders o ON o.delivery_person_id = e.id
WHERE e.nif = 'X8765432B'
GROUP BY e.first_name, e.last_name;

