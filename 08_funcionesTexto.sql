-- FUNCIONES DE TEXTO
-- Crea una tabla llamada "estudiantes" con cinco columnas: "id" de tipo INT como clave primaria, "nombre" de tipo VARCHAR(50), 
-- "apellido" de tipo VARCHAR(50), "edad" de tipo INT y "promedio" de tipo FLOAT. Luego, inserta cinco filas en la tabla "estudiantes" 
-- con los siguientes datos:

-- ID: 1, Nombre: Juan, Apellido: Pérez, Edad: 22, Promedio: 85.5
-- ID: 2, Nombre: María, Apellido: Gómez, Edad: 21, Promedio: 90.0
-- ID: 3, Nombre: Luis, Apellido: Rodríguez, Edad: 20, Promedio: 88.5
-- ID: 4, Nombre: Ana, Apellido: Martínez, Edad: 23, Promedio: 92.0
-- ID: 5, Nombre: Carlos, Apellido: López, Edad: 22, Promedio: 86.5

CREATE TABLE IF NOT EXISTS estudiantes (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
edad INT,
promedio FLOAT
);

INSERT INTO estudiantes (nombre, apellido, edad, promedio)
VALUES ('Juan', 'Perez', 22, 85.5),
    ('Maria', 'Gomez', 21, 90.0),
    ('Luis', 'Rodriguez', 20, 88.5),
    ('Ana', 'Martinez', 23, 92.0),
    ('Carlos', 'Lopez', 22, 86.5);

-- Encuentra la longitud del nombre del estudiante con el nombre "Luis" y apellido "Rodríguez".
SELECT LENGTH(e.nombre) FROM estudiantes AS e 
WHERE e.nombre = 'Luis' AND e.apellido = 'Rodriguez'; 

-- Concatena el nombre y el apellido del estudiante con el nombre "María" y apellido "Gómez" con un espacio en el medio. 
SELECT CONCAT_WS(' ', e.nombre, e.apellido) AS 'nombre y apellido' FROM estudiantes AS e
WHERE e.nombre = 'Maria' AND e.apellido = 'Gomez';

-- Encuentra la posición de la primera 'e' en el apellido del estudiante con el nombre "Juan" y apellido "Pérez".
SELECT INSTR(e.apellido, 'e') AS 'LETRA ENCONTRADA' FROM estudiantes AS e
WHERE e.nombre = 'Juan' AND e.apellido = 'Perez';

-- Inserta la cadena ' García' en la posición 3 del nombre del estudiante con el nombre "Ana" y apellido "Martínez".
SELECT INSERT(e.nombre, 3, 0, 'Garcia') FROM estudiantes AS e
WHERE e.nombre = 'Carlos' AND e.apellido = 'Lopez';

-- Convierte el nombre del estudiante con el nombre "Luis" y apellido "Rodríguez" a minúsculas. (LOWER)
SELECT LOWER(e.nombre) FROM estudiantes AS e
WHERE e.nombre = 'Luis' AND e.apellido = 'Rodriguez';

-- Convierte el apellido del estudiante con el nombre "Juan" y apellido "Pérez" a mayúsculas. (UPPER)

-- Obtiene los primeros 4 caracteres del apellido del estudiante con el nombre "María" y apellido "Gómez". (LEFT)

-- Obtiene los últimos 3 caracteres del apellido del estudiante con el nombre "Ana" y apellido "Martínez". (RIGHT)

-- Encuentra la posición de la primera 'o' en el nombre del estudiante con el nombre "Carlos" y apellido "López". (LOCATE)

-- Encuentra la posición de la primera aparición de la letra 'a' en el nombre de la estudiante con el nombre "María" y apellido "Gómez".

-- Reemplaza 'a' con 'X' en el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 

-- Encuentra la subcadena de 3 caracteres de longitud de la columna 'nombre' del estudiante con el nombre "María" y apellido "Gómez", comenzando en la posición 2.

-- Combina los nombres de todos los estudiantes en una única cadena separada por guiones.

-- Combina los nombres y apellidos de todos los estudiantes en una única cadena separada por un guion vertical (|). 

-- Elimina los espacios en blanco iniciales del texto "    … usé muchos espacios    ".

-- Elimina los espacios en blanco finales del texto "    … usé muchos espacios    ".

-- Cita el resultado de los dos ejercicios anteriores utilizando la función QUOTE.

-- Inserta la cadena ' García' en la posición 3 del nombre del estudiante con el nombre "Ana" y apellido "Martínez".

-- Convierte el nombre del estudiante con el nombre "Luis" y apellido "Rodríguez" a minúsculas. (LOWER)

-- Convierte el apellido del estudiante con el nombre "Juan" y apellido "Pérez" a mayúsculas. (UPPER)

-- Obtiene los primeros 4 caracteres del apellido del estudiante con el nombre "María" y apellido "Gómez". (LEFT)

-- Obtiene los últimos 3 caracteres del apellido del estudiante con el nombre "Ana" y apellido "Martínez". (RIGHT)

-- Encuentra la posición de la primera 'o' en el nombre del estudiante con el nombre "Carlos" y apellido "López". (LOCATE)

-- Encuentra la posición de la primera aparición de la letra 'a' en el nombre de la estudiante con el nombre "María" y apellido "Gómez".

-- Reemplaza 'a' con 'X' en el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 

-- Encuentra la subcadena de 3 caracteres de longitud de la columna 'nombre' del estudiante con el nombre "María" y apellido "Gómez", comenzando en la posición 2.

-- Combina los nombres de todos los estudiantes en una única cadena separada por guiones.

-- Combina los nombres y apellidos de todos los estudiantes en una única cadena separada por un guion vertical (|). 

-- Elimina los espacios en blanco iniciales del texto "    … usé muchos espacios    ".

-- Elimina los espacios en blanco finales del texto "    … usé muchos espacios    ".

-- Cita el resultado de los dos ejercicios anteriores utilizando la función QUOTE.

-- FUNCIONES DE TEXTO PARTE 2
-- Repite el nombre y apellido del estudiante con el nombre "Juan" y apellido "Pérez" tres veces. 

-- Invierte el nombre del estudiante con el nombre "Ana" y apellido "Martínez". 

-- Devuelve una cadena que contenga 8 caracteres de espacio usando la función SPACE y muéstrala con la función QUOTE.

-- Extrae una subcadena que contiene el nombre del estudiante con el nombre "María" y apellido "Gómez" antes
-- de la segunda a utilizando SUBSTRING_INDEX.

-- Combina las edades de todos los estudiantes en una única cadena separada por comas y orden descendente.

-- Elimina las ‘a’ del nombre' del estudiante con el nombre "Ana" y apellido "Martínez" usando la función REPLACE. 

-- Rellena a la derecha el promedio del estudiante con el nombre "Luis" y apellido "Rodríguez" con asteriscos 
-- hasta una longitud total de 10 caracteres. 

-- Obtén el promedio del estudiante con nombre 'Carlos' y apellido 'López', formateado con dos decimales 
-- y utilizando la configuración regional 'es_AR'.