CREATE TABLE IF NOT EXISTS envios (
id INT AUTO_INCREMENT PRIMARY KEY,
fecha_envio DATETIME,
fecha_entrega DATETIME,
codigo_producto VARCHAR(10)
);

INSERT INTO envios (fecha_envio, fecha_entrega, codigo_producto) VALUES
('2022-01-15 08:00:00','2022-01-20 12:30:00','ABC123'),
('2022-02-10 10:15:00','2022-02-15 14:45:00','XYZ789'),
('2022-03-05 09:30:00','2022-03-10 13:20:00','PQR456'),
('2022-04-20 11:45:00','2022-04-25 15:10:00','LMN001'),
('2022-05-12 07:55:00','2022-05-17 10:25:00','DEF777'),
('2022-06-08 08:20:00','2022-06-13 12:40:00','GHI888'),
('2022-07-03 10:05:00','2022-07-08 14:15:00','JKL999');

-- Utiliza la función DATE para extraer la fecha de envío del envío con ID 3.

select ID, DATE(fecha_envio) as FechaEnvio from envios where ID = 3;

-- Utiliza la función DATE_ADD para calcular la fecha de entrega programada para el envío con código de producto 'XYZ789'
-- si se le agregan 3 días a la fecha de envío.

select DATE_ADD(fecha_entrega, interval 3 DAY) as FechaModificada from envios where codigo_producto = 'XYZ789';

-- Utiliza la función DATE_FORMAT para mostrar la fecha de envío del envío con ID 6 en el formato 'DD-MM-YYYY'.

select DATE_FORMAT(fecha_envio, '%d,%m,%Y') as FormatoModificado from envios where id = 6;

-- Utiliza la función DATE_SUB para calcular la fecha de envío del envío con ID 4 si se le restan 2 días.

select DATE_SUB(fecha_envio, interval 2 DAY) as FechaSubstraccion from envios where id = 4;

-- Utiliza la función DATEDIFF para calcular la diferencia en días entre la fecha de envío y la fecha de entrega programada
-- para el envío con código de producto 'PQR456'.

select DATEDIFF(fecha_envio, fecha_entrega) as DiferenciaFechas from envios where codigo_producto = 'PQR456';

-- Utiliza la función DAY para obtener el día del mes en que se realizó el envío con ID 2.

select day(fecha_envio) as DiaFecha from envios where id = 2;

-------------------------------------------

-- Utiliza la función DAYNAME para obtener el nombre del día de la semana en que se entregará el envío con código de 
-- producto 'DEF777'.

SELECT DAYNAME(e.fecha_entrega) FROM envios AS e
WHERE e.codigo_producto = 'DEF777';


-- Utiliza la función DAYOFMONTH para obtener el día del mes en que se entregará el envío con código de 
-- producto 'GHI888'.

SELECT DAYOFMONTH(e.fecha_entrega) FROM envios AS e
WHERE e.codigo_producto = 'GHI888';


-- Utiliza la función PERIOD_ADD para agregar un período de 3 meses al año-mes '2022-07'.

SELECT PERIOD_ADD(202207, 3);


-- Utiliza la función PERIOD_DIFF para calcular el número de meses entre los períodos '2022-03' y '2022-12'.

SELECT PERIOD_DIFF(202203, 202212);


-- Utiliza la función QUARTER para obtener el trimestre de la fecha de entrega del envío con código de
--  producto 'PQR456'.

SELECT QUARTER(e.fecha_entrega) FROM envios AS e
WHERE e.codigo_producto = 'PQR456';

-- Utiliza la función SEC_TO_TIME para convertir 3665 segundos en formato 'hh:mm:ss'.

SELECT SEC_TO_TIME(3665);

-------------------------

--Utiliza la función SECOND para obtener los segundos de la hora de envío del envío con ID 2.
select second(fecha_envio) as segundos_envio
from envios
where id = 2;

--Utiliza la función STR_TO_DATE para convertir la cadena '2022()08()15' en una fecha.
select str_to_date('2022()08()15', '%Y()%m()%d') as fecha_traducida;

--Utiliza la función SUBDATE (o DATE_SUB) para restar 5 días a la fecha de entrega del envío con código de producto 'GHI888'.
select subdate(fecha_entrega, interval 5 day) as fecha_menos_5
from envios
where codigo_producto = 'GHI888';

--Utiliza la función SUBTIME para restar 2 horas y 15 minutos a la hora de envío del envío con ID 7.
select subtime(fecha_envio, '02:15:00') as nueva_hora
from envios
where id = 7;

--Utiliza la función TIME para extraer la porción de tiempo de la fecha de envío del envío con ID 1.
select time(fecha_envio) as tiempo_fecha_envio_1
from envios
where id = 1;

--Utiliza la función TIME_FORMAT para formatear la hora de envío del envío con ID 2 en 'hh:mm:ss'.
select time_format(fecha_envio, '%h:%i:%s') AS hora_formateada
from envios
where id = 2;

-------------------------

-- 25. Utiliza la función TIME_TO_SEC para convertir la hora del envío con ID 3 en segundos.

SELECT TIME_TO_SEC(fecha_envio) FROM envios WHERE id = 3; -- Funciona con o sin TIME()

-- 26. Utiliza la función TIMEDIFF para calcular la diferencia de horas entre las fechas de envío y entrega del envío con ID 4.

SELECT TIMEDIFF(fecha_entrega, fecha_envio) FROM envios WHERE id = 4;

-- 27. Utiliza la función SYSDATE para obtener la hora exacta en la que se ejecuta la función en la consulta. Para comprobar esto invoca SYSDATE, luego la función SLEEP durante 5 segundos y luego vuelve a invocar la función SYSDATE, y verifica la diferencia entre ambas invocaciones con TIMEDIFF.

-- SELECT NOW(), SLEEP(5), NOW();
SELECT SYSDATE(), SLEEP(5), SYSDATE();

-- 28. Crea una consulta que utilice la función TIMESTAMP para obtener todos los valores de fecha_envio sumandole 12 horas.

SELECT TIMESTAMP(fecha_envio, '12:00:00') FROM envios;

-- 29. Utiliza la función TIMESTAMPADD para agregar 3 horas a la fecha de entrega del envío con código de producto 'XYZ789'.

SELECT TIMESTAMPADD(HOUR, 3, fecha_entrega) FROM envios WHERE codigo_producto = 'XYZ789';