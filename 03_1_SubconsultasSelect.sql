-- EJERCICIOS DML
INSERT INTO productos (nombre, precio) VALUES ('Teléfono móvil', 450.00);
INSERT INTO clientes (nombre, direccion) VALUES ('María García', 'Constitución 456, Luján');

-- Modificar la columna correo_electronico para generarse automáticamente
ALTER TABLE empleados
MODIFY correo_electronico VARCHAR(100) GENERATED ALWAYS AS (CONCAT(nombre, apellido, '@mail.com')) STORED;

-- Insertar nuevos empleados
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id) VALUES ('Luis', 'Fernández', 28, 2800.00, 1);
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id) VALUES ('Marta', 'Ramírez', 32, 3100.00, 1);
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id) VALUES ('Lorena', 'Guzmán', 26, 2600.00, 1);

-- Actualizar datos
UPDATE productos SET precio = 1350.00 WHERE nombre = 'Laptop';
UPDATE clientes SET direccion = 'Alberti 1789, Mar del Plata' WHERE nombre = 'Juan Pérez';
UPDATE empleados SET salario = salario * 1.05;
UPDATE productos SET precio = 480.00 WHERE nombre = 'Teléfono móvil';
UPDATE clientes SET direccion = 'Avenida 789, Ciudad del Este' WHERE nombre = 'María García';
UPDATE empleados SET salario = salario * 1.07 WHERE departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Ventas');

-- Insertar más datos
INSERT INTO productos (nombre, precio) VALUES ('Tablet', 350.00);
INSERT INTO productos (nombre, precio) VALUES ('Impresora', 280.00);
INSERT INTO clientes (nombre, direccion) VALUES ('Ana López', 'Beltrán 1452, Godoy Cruz');
INSERT INTO clientes (nombre, direccion) VALUES ('Carlos Sánchez', 'Saavedra 206, Las Heras');

-- consultar datos en la tabla ventas, empleados, clientes y productos para comparar con los la plataforma
SELECT * from ventas;
SELECT * from empleados;
SELECT * from clientes;
SELECT * from productos;


-- Inserta una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Laptop"
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES 
((SELECT id FROM productos WHERE nombre = 'Laptop'), 
 (SELECT id FROM clientes WHERE nombre = 'Juan Pérez'), 
 2, 1200.00, 
 (SELECT id FROM empleados WHERE nombre = 'Ana' AND apellido = 'Rodríguez'));

-- Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil"
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES 
((SELECT id FROM productos WHERE nombre = 'Teléfono móvil'), 
 (SELECT id FROM clientes WHERE nombre = 'María García'), 
 3, 450.00, 
 (SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López'));

-- Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora"
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES 
((SELECT id FROM productos WHERE nombre = 'Impresora'), 
 (SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'), 
 1, 280.00, 
 (SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez'));

-- Inserta una venta en la tabla "ventas" donde el cliente "Ana López" compra una "Laptop"
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES 
((SELECT id FROM productos WHERE nombre = 'Laptop'), 
 (SELECT id FROM clientes WHERE nombre = 'Ana López'), 
 1, 1200.00, 
 (SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López'));

-- Crea una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Tablet"
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES 
((SELECT id FROM productos WHERE nombre = 'Tablet'), 
 (SELECT id FROM clientes WHERE nombre = 'Juan Pérez'), 
 2, 350.00, 
 (SELECT id FROM empleados WHERE nombre = 'Luis' AND apellido = 'Fernández'));

-- Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil"
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES 
((SELECT id FROM productos WHERE nombre = 'Teléfono móvil'), 
 (SELECT id FROM clientes WHERE nombre = 'María García'), 
 1, 450.00, 
 (SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez'));

-- Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora"
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) 
VALUES 
((SELECT id FROM productos WHERE nombre = 'Impresora'), 
 (SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'), 
 2, 280.00, 
 (SELECT id FROM empleados WHERE nombre = 'Lorena' AND apellido = 'Guzmán'));

-- Consulta de la tabla "ventas"
SELECT id, producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id FROM ventas;