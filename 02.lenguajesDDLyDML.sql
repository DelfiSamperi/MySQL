-- MODIFICAR TABLA "empleados"
-- Hacer que la columna "edad" no permita valores nulos
ALTER TABLE empleados MODIFY edad INT NOT NULL;

-- Establecer un valor predeterminado de 0 para la columna "salario"
ALTER TABLE empleados MODIFY salario DECIMAL(10, 2) DEFAULT 0;

-- Agregar columna "departamento"
ALTER TABLE empleados ADD departamento VARCHAR(50);

-- Agregar columna "correo_electronico"
ALTER TABLE empleados ADD correo_electronico VARCHAR(100);

-- Eliminar la columna "fecha_contratacion"
ALTER TABLE empleados DROP COLUMN fecha_contratacion;

-- Volver a agregar la columna "fecha_contratacion" con valor predeterminado de la fecha actual
-- En caso tengas problemas con el current_date o el now() usa 
ALTER TABLE empleados ADD fecha_contratacion DATE DEFAULT (CURDATE());
-- ALTER TABLE empleados ADD fecha_contratacion DATE DEFAULT CURRENT_DATE;

-- Crear tabla "departamentos"
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Agregar columna "departamento_id" en la tabla "empleados"
ALTER TABLE empleados ADD departamento_id INT;

-- Establecer una restricción de clave foránea en la columna "departamento_id"
ALTER TABLE empleados ADD CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES departamentos(id);

-- Eliminar la columna "departamento" de la tabla "empleados"
ALTER TABLE empleados DROP COLUMN departamento;

-- Actividad: Aplicando DML
-- Insertar datos en la tabla "departamentos"
INSERT INTO departamentos (nombre) VALUES ('Ventas');
INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos');

-- Insertar datos en la tabla "empleados"
INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id) VALUES
('Ana', 'Rodríguez', 28, 3000.00, 'anarodriguez@mail.com', 1),
('Carlos', 'López', 32, 3200.50, 'carloslopez@mail.com', 2),
('Laura', 'Pérez', 26, 2800.75, 'lauraperez@mail.com', 1),
('Martín', 'González', 30, 3100.25, 'martingonzalez@mail.com', 2);

-- Actualizar el salario del empleado "Ana" en un 10%
UPDATE empleados
SET salario = salario * 1.10
WHERE nombre = 'Ana';

-- Crear un nuevo departamento "Contabilidad"
INSERT INTO departamentos (nombre) VALUES ('Contabilidad');

-- Cambiar el departamento del empleado "Carlos" a "Contabilidad"
UPDATE empleados
SET departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Contabilidad')
WHERE nombre = 'Carlos';

-- Eliminar al empleado con nombre "Laura"
DELETE FROM empleados
WHERE nombre = 'Laura';


-- Deshabilitar el modo seguro de actualizaciones si es necesario
-- SET SQL_SAFE_UPDATES = 0;

-- Consultas para verificar los datos
-- Consulta de la tabla "empleados"
SELECT id, nombre, apellido, edad, salario, correo_electronico, fecha_contratacion, departamento_id
FROM empleados;

-- Consulta de la tabla "departamentos"
SELECT id, nombre
FROM departamentos;

---------------------------------------

-- Actividad: Práctica avanzada
-- Crear tabla "clientes"
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

-- Crear tabla "productos"
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Crear tabla "ventas"
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    cliente_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    monto_total DECIMAL(10, 2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    empleado_id INT NOT NULL,
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES productos(id),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_empleado FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

-- Insertar datos iniciales
INSERT INTO clientes (nombre, direccion) VALUES ('Juan Pérez', 'Libertad 3215, Mar del Plata');
INSERT INTO productos (nombre, precio) VALUES ('Laptop', 1200.00);
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES
(1, 1, 2, 1200.00, 1);

-- Consultar datos de la tabla "ventas"
SELECT id, producto_id, cliente_id, cantidad, precio_unitario, monto_total, empleado_id
FROM ventas;