-- Ejercicios JOIN Parte 1
-- Encuentra el nombre y apellido de los empleados junto con la cantidad total de ventas que han realizado.

SELECT e.nombre, e.apellido, SUM(v.cantidad) AS "productos vendidos"
FROM ventas v INNER JOIN empleados e 
ON v.empleado_id = e.id
GROUP BY e.nombre, e.apellido; 

-- Calcula el monto total vendido a cada cliente y muestra el nombre del cliente, su dirección y el monto total.

SELECT c.nombre AS "cliente", c.direccion AS "adress", SUM(v.monto_total) as "total compras"
FROM ventas v RIGHT JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.id; 

-- Encuentra los productos vendidos por cada empleado en el departamento de "Ventas" y muestra el nombre del 
-- empleado junto con el nombre de los productos que han vendido.

SELECT e.nombre, e.apellido, p.nombre AS "productos vendidos"
FROM empleados e 
INNER JOIN ventas v ON e.id = v.empleado_id
INNER JOIN productos p ON v.producto_id = p.id
INNER JOIN departamentos d ON e.departamento_id = d.id WHERE d.nombre = "ventas";


-- Encuentra el nombre del cliente, el nombre del producto y la cantidad comprada de productos con un precio 
-- superior a $500.

SELECT c.nombre AS "cliente", p.nombre AS "producto", SUM(v.cantidad) AS "cantidad comprada"
FROM clientes c 
INNER JOIN ventas v ON c.id = v.cliente_id
INNER JOIN  productos p ON v.producto_id = p.id WHERE p.precio > 500
GROUP BY c.nombre, p.nombre;

-----------------
-- Ejercicios JOIN Parte 2
-- Calcula la cantidad de ventas por departamento, incluso si el departamento no tiene ventas.



-- Encuentra el nombre y la dirección de los clientes que han comprado más de 3 productos distintos y muestra la 
-- cantidad de productos comprados.



-- Calcula el monto total de ventas realizadas por cada departamento y muestra el nombre del departamento junto con
--  el monto total de ventas.



-----------------
-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el
--  tema visto, pero no son obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos. 



-- Muestra el nombre y apellido de los empleados que pertenecen al departamento de "Recursos Humanos" y han 
-- realizado más de 5 ventas.



-- Muestra el nombre y apellido de todos los empleados junto con la cantidad total de ventas que han realizado, 
-- incluso si no han realizado ventas.



-- Encuentra el empleado más joven de cada departamento y muestra el nombre del departamento junto con el nombre 
-- y la edad del empleado más joven.



-- Calcula el volumen de productos vendidos por cada producto (por ejemplo, menos de 5 como "bajo", entre 5 y 10 
-- como "medio", y más de 10 como "alto") y muestra la categoría de volumen junto con la cantidad y el nombre del
-- producto.

