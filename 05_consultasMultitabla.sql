-- -- a partir de linea 787 de Calisto
-- ----
-- CONSULTAS MULTITABLA - Parte 1

-- Une las tablas de empleados con departamentos y solo muestra las columnas nombre, apellido, edad, salario 
-- de empleados y la columna nombre de departamentos.

SELECT e.nombre, e.apellido, e.edad, e.salario, d.nombre FROM  empleados e, depart
amentos d WHERE e.departamento_id = d.id;

SELECT e.nombre, e.apellido, e.edad, e.salario,
       (SELECT d.nombre FROM departamentos d WHERE d.id = e.departamento_id) AS departamento
FROM empleados e;

-- Une las tablas ventas con la tabla empleados donde se muestren todas las columnas de ventas exceptuando 
-- la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados.

SELECT v.id, v.producto_id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total,
    (SELECT e.nombre FROM empleados e WHERE e.id = v.empleado_id) AS nombre_vendedor,
    (SELECT e.apellido FROM empleados e WHERE e.id = v.empleado_id) AS apellido_vendedor
FROM ventas v;

-- Une las tablas ventas con la tabla productos donde se muestren todas las columnas de ventas exceptuando la 
-- columna producto_id y en su lugar muestres la columna nombre de la tabla productos.

SELECT v.id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total, v.empleado_id,
    (SELECT p.nombre FROM productos p WHERE p.id = v.producto_id) AS producto
FROM ventas v;

-- Une las tablas ventas con la tabla clientes donde se muestren todas las columnas de ventas exceptuando la 
-- columna cliente_id y en su lugar muestres la columna nombre de la tabla clientes.

SELECT v.id, v.producto_id, v.cantidad, v.precio_unitario, v.monto_total, v.empleado_id,
    (SELECT c.nombre FROM clientes c WHERE c.id = v.cliente_id) AS cliente
FROM ventas v;

-- Une las tablas ventas con la tablas empleados y departamentos donde se muestren todas las columnas de ventas 
-- exceptuando la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados y además 
-- muestres la columna nombre de la tabla departamentos.

SELECT v.id, v.producto_id, v.cliente_id, v.cantidad, v.precio_unitario, v.monto_total,
    (SELECT e.nombre FROM empleados e WHERE e.id = v.empleado_id) AS nombre_vendedor,
    (SELECT e.apellido FROM empleados e WHERE e.id = v.empleado_id) AS apellido_vendedor,
    (SELECT d.nombre FROM departamentos d WHERE d.id = 
        (SELECT e.departamento_id FROM empleados e WHERE e.id = v.empleado_id)) 
    AS departamento
FROM ventas v;

-- Une las tablas ventas, empleados, productos y clientes donde se muestren las columnas de la tabla ventas 
-- reemplazando sus columnas de FOREIGN KEYs con las respectivas columnas de “nombre” de las otras tablas.

SELECT v.id, v.cantidad, v.precio_unitario, v.monto_total,
    (SELECT e.nombre FROM empleados e WHERE e.id = v.empleado_id) AS nombre_vendedor,
    (SELECT e.apellido FROM empleados e WHERE e.id = v.empleado_id) AS apellido_vendedor,
    (SELECT d.nombre FROM departamentos d WHERE d.id = 
        (SELECT e.departamento_id FROM empleados e WHERE e.id = v.empleado_id)) 
    AS departamento,
        (SELECT p.nombre FROM productos p WHERE p.id = v.producto_id) AS producto,
        (SELECT c.nombre FROM clientes c WHERE c.id = v.cliente_id) AS cliente
FROM ventas v;

-- Calcular el salario máximo de los empleados en cada departamento y mostrar el nombre del departamento junto 
-- con el salario máximo.

SELECT d.nombre AS 'departamento', MAX(e.salario) AS 'salario maximo'
FROM empleados e, departamentos d
WHERE e.departamento_id = d.id GROUP BY d.nombre;

---------------
-- Ejercicios consultas multitabla - Parte 2 
-- Calcular el monto total de ventas por departamento y mostrar el nombre del departamento junto con el monto total de ventas.



-- Encontrar el empleado más joven de cada departamento y mostrar el nombre del departamento junto con la edad del empleado más joven.

-- Calcular el volumen de productos vendidos por cada producto (por ejemplo, menos de 5 “bajo”, menos 8 “medio” y mayor o igual a 
-- 8 “alto”) y mostrar la categoría de volumen junto con la cantidad y el nombre del producto.

-- Encontrar el cliente que ha realizado el mayor monto total de compras y mostrar su nombre y el monto total.

-- Calcular el precio promedio de los productos vendidos por cada empleado y mostrar el nombre del empleado junto con el precio promedio 
-- de los productos que ha vendido.

-- Encontrar el departamento con el salario mínimo más bajo entre los empleados y mostrar el nombre del departamento junto con el salario
-- mínimo más bajo.

-- Encuentra el departamento con el salario promedio más alto entre los empleados mayores de 30 años y muestra el nombre del departamento 
-- junto con el salario promedio. Limita los resultados a mostrar solo los departamentos con el salario promedio mayor a 3320.

-- ✏️  Actividad: Ejercicios Complementarios
-- ✨ Estos ejercicios son de tipo complementario. Esto quiere decir que te ayudará a avanzar en profundidad en el tema visto, pero no son 
-- obligatorios. Te recomendamos intentar con tu equipo trabajar algunos de ellos. 


-- Encontrar la cantidad de productos vendidos por cada empleado y mostrar el nombre del empleado junto con la cantidad de productos 
-- vendidos.

-- Calcular el monto total de ventas por cada cliente y mostrar el nombre del cliente junto con el monto total de sus compras.

-- Encontrar el producto más caro vendido y mostrar su nombre y precio.

-- Calcular el salario promedio de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario promedio.

-- Encontrar la cantidad total de ventas realizadas por cada empleado y mostrar el nombre y apellido del empleado junto con la cantidad 
-- total de ventas.

-- Encuentra la cantidad de ventas realizadas por cada empleado y muestra el nombre y apellido del empleado junto con la cantidad total de
-- ventas. Limita los resultados a mostrar solo a los empleados que hayan realizado más de 5 ventas y ordenarlos de forma descendente con 
-- respecto a la cantidad de ventas.

-- Calcula el monto total vendido por cada empleado y muestra el nombre del empleado junto con el monto total. Usa la cláusula HAVING para
--  filtrar a aquellos empleados que hayan vendido más de 10 productos en total. Muestra el resultado en orden descendente según el monto 
-- total vendido.

-- Encuentra el monto total vendido a cada cliente y muestra el nombre del cliente junto con el monto total. Usa la cláusula HAVING para 
-- filtrar a aquellos clientes cuyo monto total promedio en sus compras sea superior a $1500. Muestra el resultado en orden descendente 
-- según el monto total vendido.

-- Calcula la cantidad total de ventas realizadas a cada cliente y muestra el nombre del cliente junto con la cantidad total de ventas. 
-- Limita los resultados a mostrar solo a los clientes que hayan realizado más de 3 ventas ordénalos de forma descendente según la cantidad
-- de ventas.

-- Encuentra los productos más caros vendidos (precio mayor a 1000), muestra su nombre y precio y ordenarlos de forma descendente por precio.