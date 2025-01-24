-- SHOW TABLES;

-- VISTAS Y FUNCIONES MATEMATICAS
-- Crea una tabla triangulos_rectangulos con dos columnas: longitud_lado_adyacente y longitud lado_opuesto, ambos de tipo INT.
-- Rellena la tabla triangulos_rectangulos con 10 filas con enteros aleatorios entre 1 y 100

create table triangulos_rectangulos (
longitud_lado_adyacente int,
longitud_lado_opuesto int
);
---- OPCION 1
insert into triangulos_rectangulos values(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100))),
(FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100)))
;
---- OPCION 2
CREATE PROCEDURE insertar_triangulos_rectangulos()
BEGIN
DECLARE i INT DEFAULT 1;

WHILE i <= 10 DO
INSERT INTO triangulos_rectangulos (longitud_lado_adyacente, longitud_lado_opuesto)
VALUES (FLOOR(1 + (RAND() * 100)), FLOOR(1 + (RAND() * 100)));

SET i = i + 1;
END WHILE;
END;

CALL insertar_triangulos_rectangulos();
-- Crea una vista donde agregues la columna “hipotenusa” calculándola a partir de los otros dos lados. Utiliza el 
-- teorema de Pitágoras para realizar el cálculo: Siendo el lado adyacente “A” y el opuesto “B” y la hipotenusa “C”
-- la fórmula quedaría de la siguiente forma:

-- C =A2+B2​

CREATE OR REPLACE VIEW calculo_triangulo AS
SELECT *,
FORMAT(SQRT(POW(longitud_lado_adyacente,2)+ POW(longitud_lado_opuesto,2)),2) AS hypotenuse
FROM triangulos_rectangulos;

-- Reemplaza la vista y ahora agrégale dos columnas para calcular el ángulo α en radianes y grados. Aquí tienes 
-- dos fórmulas:
-- En radianes: =arcsen(BC) =arccos(AC) = arctan(BA)  
-- Reemplaza la vista y ahora agrégale dos columnas para calcular el ángulo β en radianes y grados. Aquí tienes 
-- dos fórmulas:
-- En radianes: β =arccos(BC)=arcsen(AC) = arctan(AB)  

-- Reemplaza la vista y ahora agrégale dos columnas para calcular el ángulo γ en radianes y grados. Como se trata
-- de triángulos rectángulos, el ángulo es de 90°, pero aplica una fórmula de igual manera, usa la regla de que 
-- la suma de los ángulos de un triángulo suma 180°.

CREATE OR REPLACE VIEW calculo_triangulo AS
SELECT *,
FORMAT(SQRT(POW(longitud_lado_adyacente,2)+ POW(longitud_lado_opuesto,2)),2) AS c
FROM triangulos_rectangulos;

SELECT longitud_lado_adyacente AS a, longitud_lado_opuesto AS b, c,
FORMAT(DEGREES(atan(longitud_lado_opuesto/longitud_lado_adyacente)),2) as ra,
FORMAT(DEGREES(atan(longitud_lado_adyacente/longitud_lado_opuesto)),2) as rb
FROM calculo_triangulo;
-- Crea una tabla triangulos_rectangulos_2 con dos columnas: angulo_alfa y una hipotenusa ambos de tipo INT.
CREATE TABLE IF NOT EXISTS triangulos_rectangulos_2 (
    angulo_alfa INT,
    hipotenusa INT
);
-- Rellena la tabla triangulos_rectangulos_2 con 10 filas con enteros aleatorios entre 1 y 89 para angulo_alfa y enteros aleatorios entre 1 y 100 para la columna hipotenusa.

CREATE PROCEDURE triangulos_rectangulos_2()
BEGIN
DECLARE i INT DEFAULT 1;

WHILE i <= 10 DO
INSERT INTO triangulos_rectangulos_2 (angulo_alfa, hipotenusa)
VALUES (FLOOR(1 + (RAND() * 89)), FLOOR(1 + (RAND() * 100)));

SET i = i + 1;
END WHILE;
END;

CALL triangulos_rectangulos_2();

SELECT * FROM triangulos_rectangulos_2;

-- Crea una vista donde agregues la columna lado_adyacente donde calcules su longitud.

CREATE OR REPLACE VIEW triangulo2 AS
SELECT *,
ROUND(COS(angulo_alfa*PI()/180)*hipotenusa,2) AS adyacente
FROM triangulos_rectangulos_2;

SELECT * FROM triangulo2;

-- Agrega a la vista la columna lado_opuesto donde calcules su longitud.

CREATE OR REPLACE VIEW triangulo2 AS
SELECT *,
ROUND(COS(angulo_alfa*PI()/180)*hipotenusa,2) AS adyacente,
ROUND(SIN(angulo_alfa*PI()/180)*hipotenusa,2) as opuesto
FROM triangulos_rectangulos_2;

SELECT * FROM triangulo2;

-- Agrega a la vista la columna angulo_beta donde calcules su valor en grados.


-- Agrega a la vista la columna angulo_gamma donde calcules su valor en grados.

CREATE OR REPLACE VIEW triangulo2 AS
SELECT *,

ROUND(180-angulo_alfa-beta) AS gamma
FROM (
SELECT *, ROUND(ACOS(opuesto / hipotenusa) * 180 / PI(), 2) AS beta

FROM (
SELECT *,
ROUND(COS(angulo_alfa * PI() / 180) * hipotenusa, 2) AS adyacente,
ROUND(SIN(angulo_alfa * PI() / 180) * hipotenusa, 2) AS opuesto
FROM triangulos_rectangulos_2
) subquery
)subqyery_1;

SELECT * FROM triangulo2;

-- Redondea todos los valores con hasta dos números decimales.

--------------------------------

-- Crea una tabla mensajes que tenga una columna “datos” de tipo varchar y una columna valor_crc de tipo int, con 
-- las siguientes filas: VALUES

--     ('Hola, ¿cómo estás? Espero que tengas un buen día.',3221685809),
--     ('Ayer fui al cine a ver una película genial.', 951196167),
--     ('Estoy emocionado por el próximo fin de semana.', 3275166159),
--     ('Mi reunión se pospuso para el martes que viene.', 169741145),
--     ('He estado trabajando en un proyecto importante.', 6480112535),
--     ('Esta receta de pastel de manzana es deliciosa.', 2524836786),
--     ('Planeo hacer un viaje a la playa este verano.', 5107635050),
--     ('Mi gato se divierte jugando con su pelota.', 3578632817),
--     ('Hoy es un día soleado y agradable.', 3675102258),
--     ('El libro que estoy leyendo es muy interesante.', 854938277);

-- Crea una vista con una tercera columna “análisis” donde verifiques si el valor crc del mensaje es igual al 
-- valor de la segunda columna, si no es igual muestra un mensaje “adulterado” en la tercera columna o “correcto” 
-- en el caso contrario.

-- Crea una tabla llamada ahorros con tres columnas: ahorro_inicial (la cantidad inicial de ahorros en dólares) de 
-- tipo decimal(10, 2), periodos (el número de períodos en años) de tipo int, y tasa_interes (la tasa de interés
-- nominal anual en porcentaje) de tipo decimal(5, 2). 

-- Llena la tabla con 10 filas de números aleatorios para ahorro_inicial (un valor mayor a 1000), periodos (un
-- valor entre 1 y 10), y tasa_interes (un valor entre 1 y 1,20).

-- Crea una vista llamada vista_ahorros_futuros que incluya una columna con el cálculo de los ahorros futuros 
-- ajustados por la tasa de interés. Para esto utilizaremos la fórmula para calcular el interés compuesto:

-- VF = VA x (1+r)^n
-- VF: Valor futuro (ahorros futuros).
-- VA: Valor actual (ahorro_inicial).
-- r: La tasa de interés (tasa_interes).
-- n: El número de periodos (periodos).

----------------------------

-- COMPLEMENTARIOS

-- Crea una tabla llamada concentracion_de_hidrogenos con una columna de id incremental, y otra columna 
-- nanomoles_por_litro, y rellénala con 10 números, estos numeros deben ser el resultado de elevar 10 a un 
-- exponente aleatorio entero entre 9 y (-5).

-- Crea una vista donde agregues la columna ph donde calcules el ph de la sustancia. Utiliza la siguiente formula: 

-- pH = -log[H+]
-- Log: es el logaritmo en base 10.
-- [H+]: es la concentración de hidrogeno en moles.

-- Como la tabla tiene guarda el valor de la concentración en nanomoles debes hacer la conversión a moles primero:

-- 1 mol = 1.000.000.000 nanomoles.

-- Crea una vista donde agregues la columna escala_de_ph donde etiquetes la sustancia con las siguientes 
-- categorías según su ph:

-- Acida : 7 < ph > 0
-- Neutra: ph = 7
-- Alcalina: 14 < ph > 7

-- Crea la tabla numeros_ocultos con la columna_1 de tipo varchar y la columna_2 de int y rellénala con estos valores:

-- VALUES
-- ('EB4ECB', 16),
-- ('25SK1E', 31),
-- ('8C2B88', 22),
-- ('58D660A', 15),
-- ('100010020211000', 3),
-- ('20251A2', 13),
-- ('4MFL6M', 23),
-- ('IO36L', 29),
-- ('748D676', 14),
-- ('J1G50', 32)

-- Todos los números de la primera columna de la tabla anterior están expresados en una base numérica correspondiente
-- a la segunda columna, crea una vista con una tercera columna para mostrar los números de la columna_1 expresados
-- en base 10 y ordénalos de mayor a menor.

-- Actualiza la vista_ahorros_futuros para que no incluya la columna ahorro_inicial, y luego crea una nueva vista
-- vista_ahorro_inicial donde utilices la vista_ahorros_futuros y la siguiente fórmula para calcular una nueva 
-- columna ahorro_inicial, incluye las demás columnas excepto tasa_interes en la vista final: 

-- VA = VF / (1+r)^n
-- VA: Valor actual (ahorro_inicial).
-- VF: Valor futuro (ahorros futuros).
-- r:  La tasa de interés (tasa_interes).
-- n: El número de periodos (periodos).

-- Crea una nueva vista vista_tasa_interes donde utilices la vista_ahorro_inicial y la siguiente fórmula para 
-- calcular la columna tasa_interes, incluye las demás columnas, excepto “periodos”, en la vista final:

-- r = ( (VF / VA)^(1/n) ) - 1
-- r: La tasa de interés (tasa_interes).
-- VF: Valor futuro (ahorros futuros).
-- VA: Valor actual (ahorro_inicial).
-- n: El número de periodos (periodos).

-- Crea una nueva vista vista_periodos donde utilices la vista_tasa_interes y la siguiente fórmula para calcular 
-- la columna periodos, incluye todas las columnas en la vista final:

-- n = ln(VF / VA) / ln(1 + r)
-- n: El número de periodos (periodos).
-- VF: Valor futuro (ahorros futuros).
-- VA: Valor actual (ahorro_inicial).
-- r: La tasa de interés (tasa_interes).

-- 💡Para convertir un varchar (que solo contenga números) a un número puedes sencillamente sumarle 0.