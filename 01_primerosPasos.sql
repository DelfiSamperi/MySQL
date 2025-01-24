-- Actividad: Mi primera tabla
-- Crear la base de datos mi_bd
CREATE DATABASE mi_bd;

-- Crear la base de datos mi_bd_2 y eliminarla
CREATE DATABASE mi_bd_2;
DROP DATABASE mi_bd_2;

-- Usar la base de datos mi_bd
USE mi_bd;

-- Actividad: Tabla Empleados
-- Crear tabla "empleados"
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);
