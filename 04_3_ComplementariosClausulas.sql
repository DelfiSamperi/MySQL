-- EJERCICIOS CON CLÁUSULA IN

-- Busca los empleados que trabajan en los departamentos 2 o 3.
SELECT * FROM empleados
WHERE departamento_id IN (2, 3);

-- Trae a los clientes que no tengan los IDs 2, 4 o 6.
SELECT * FROM clientes
WHERE id NOT IN (2, 4, 6);

-- Busca los productos cuyos precios son 350.00, 480.00 o 800.00.
SELECT * FROM productos
WHERE precio IN (350.00, 480.00, 800.00);


-- EJERCICIOS CON CLÁUSULA LIKE

-- Busca los empleados cuyos correos electrónicos terminan en "mail.com".
SELECT * FROM empleados
WHERE correo_electronico LIKE '%mail.com';

-- Encuentra los productos cuyos nombres tengan exactamente 6 caracteres.
SELECT * FROM productos
WHERE LENGTH(nombre) = 6;

-- Busca los clientes cuyos nombres tengan una "a" en la tercera posición.
SELECT * FROM clientes
WHERE SUBSTRING(nombre, 3, 1) = 'a';


-- EJERCICIOS CON FUNCIÓN MAX()

-- Encuentra el precio máximo de un producto.
SELECT MAX(precio) AS precio_maximo
FROM productos;

-- Encuentra el monto total máximo de una venta.
SELECT MAX(monto_total) AS monto_maximo
FROM ventas;


-- EJERCICIOS CON FUNCIÓN MIN()

-- Encuentra el precio mínimo de un producto.
SELECT MIN(precio) AS precio_minimo
FROM productos;

-- Encuentra el monto total mínimo de una venta.
SELECT MIN(monto_total) AS monto_minimo
FROM ventas;



-- EJERCICIOS CON FUNCIÓN CASE()

-- Crea una consulta que muestre el nombre de los productos y los categorice como "Laptop" si el nombre contiene la palabra "Laptop", "Teléfono" si contiene la palabra "Teléfono", y "Otros" en otros casos.
SELECT nombre,
       CASE
           WHEN nombre LIKE '%Laptop%' THEN 'Laptop'
           WHEN nombre LIKE '%Teléfono%' THEN 'Teléfono'
           ELSE 'Otros'
       END AS categoria
FROM productos;

-- Crea una consulta que muestre el ID del producto y los clasifique en categorías según la cantidad total de ventas de cada producto en la tabla 'ventas'. Utilizando una instrucción 'CASE', establece las siguientes categorías: 
-- Si la suma de la cantidad de ventas (SUM(cantidad)) es mayor o igual a 9, la categoría es 'Alto Volumen'. 
-- Si la suma de la cantidad de ventas está entre 4 y 8 (inclusive), la categoría es 'Medio Volumen'.
-- En otros casos, la categoría es 'Bajo Volumen'.
SELECT producto_id,
       CASE
           WHEN SUM(cantidad) >= 9 THEN 'Alto Volumen'
           WHEN SUM(cantidad) BETWEEN 4 AND 8 THEN 'Medio Volumen'
           ELSE 'Bajo Volumen'
       END AS categoria
FROM ventas
GROUP BY producto_id
ORDER BY SUM(cantidad) DESC;


-- Crea una consulta que muestre el ID de la venta y los categorice como "Venta pequeña" si el monto total es menor que $500, "Venta mediana" si es mayor o igual a $500 y menor que $1500, y "Venta grande" en otros casos.
SELECT id,
       CASE
           WHEN monto_total < 500 THEN 'Venta pequeña'
           WHEN monto_total BETWEEN 500 AND 1499 THEN 'Venta mediana'
           ELSE 'Venta grande'
       END AS categoria
FROM ventas;

-- Crea una consulta que muestre el nombre de los clientes y los categorice como "Dirección larga" si la longitud de su dirección es mayor o igual a 30 caracteres, "Dirección mediana" si es mayor o igual a 20 y menor que 30 caracteres, y "Dirección corta" en otros casos.
SELECT nombre, direccion,
       CASE
           WHEN LENGTH(direccion) >= 30 THEN 'Dirección larga'
           WHEN LENGTH(direccion) >= 20 THEN 'Dirección mediana'
           ELSE 'Dirección corta'
       END AS categoria
FROM clientes;

-- Crea una consulta que muestre el nombre de los empleados y los categorice como "Ventas" si pertenecen al departamento 1, "Recursos Humanos" si pertenecen al departamento 2, y "Contabilidad"  si pertenecen al departamento 3.
SELECT nombre,
       CASE
           WHEN departamento_id = 1 THEN 'Ventas'
           WHEN departamento_id = 2 THEN 'Recursos Humanos'
           WHEN departamento_id = 3 THEN 'Contabilidad'
           ELSE 'Otro'
       END AS categoria
FROM empleados;

-- Crea una consulta que muestre el nombre de los productos y los categorice de la siguiente manera:
-- Si el nombre del producto está en la lista ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 'Impresora', 'Tablet', 'Teléfono móvil') y el precio es mayor o igual a 1000, la categoría es 'Tecnología cara'.
-- Si el nombre del producto está en la lista anterior y el precio está entre 500 y 999 (inclusive), la categoría es 'Tecnología gama media'.
-- Si el nombre del producto está en la lista anterior y el precio es menor a 500, la categoría es 'Tecnología barata'.
-- Si el precio es mayor o igual a 1000 y el nombre del producto no está en la lista, la categoría es 'Caro'.
-- Si el precio está entre 500 y 999 (inclusive) y el nombre del producto no está en la lista, la categoría es 'Medio'.
-- Si el precio es menor a 500 y el nombre del producto no está en la lista, la categoría es 'Barato'.
SELECT nombre, precio,
       CASE
           WHEN nombre IN ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 'Impresora', 'Tablet', 'Teléfono móvil') AND precio >= 1000 THEN 'Tecnología cara'
           WHEN nombre IN ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 'Impresora', 'Tablet', 'Teléfono móvil') AND precio BETWEEN 500 AND 999 THEN 'Tecnología gama media'
           WHEN nombre IN ('Laptop', 'Reloj de Pulsera Inteligente', 'Reproductor de Blu-ray', 'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 'Cámara Digital', 'Impresora', 'Tablet', 'Teléfono móvil') AND precio < 500 THEN 'Tecnología barata'
           WHEN precio >= 1000 THEN 'Caro'
           WHEN precio BETWEEN 500 AND 999 THEN 'Medio'
           ELSE 'Barato'
       END AS categoria
FROM productos;
