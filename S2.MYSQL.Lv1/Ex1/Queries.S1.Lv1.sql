SELECT *
FROM supplier;

SELECT 
  g.id,
  g.brand,
  g.frame_type,
  g.frame_color,
  g.price,
  s.name AS supplier_name
FROM glasses g
JOIN supplier s ON g.supplier_id = s.id;

SELECT 
  c1.id,
  c1.name AS client_name,
  c1.email,
  c1.registration_date,
  c2.name AS referred_by
FROM client c1
LEFT JOIN client c2 ON c1.referred_by_id = c2.id;

SELECT *
FROM employee;

SELECT 
  c.name AS client_name,
  COUNT(s.id) AS total_sales,
  SUM(g.price) AS total_amount
FROM sale s
JOIN client c ON s.client_id = c.id
JOIN glasses g ON s.glasses_id = g.id
WHERE s.sale_date BETWEEN '2024-01-01' AND '2024-12-31'  -- Cambiar fechas al periodo deseado
GROUP BY c.id, c.name
ORDER BY total_sales DESC;

SELECT 
  e.name AS employee_name,
  g.brand AS glasses_model,
  COUNT(s.id) AS total_sales
FROM sale s
JOIN employee e ON s.employee_id = e.id
JOIN glasses g ON s.glasses_id = g.id
WHERE s.sale_date BETWEEN '2024-01-01' AND '2024-12-31'  -- Cambiar fechas al periodo deseado
GROUP BY e.id, e.name, g.id, g.brand
ORDER BY total_sales DESC;

SELECT DISTINCT 
  s.name AS supplier_name
FROM sale sa
JOIN glasses g ON sa.glasses_id = g.id
JOIN supplier s ON g.supplier_id = s.id
WHERE sa.id IS NOT NULL;
