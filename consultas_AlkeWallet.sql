-- 1. Obtener el nombre de la moneda elegida por un usuario específico

SELECT t.transaccion_id, m.currency_name
FROM moneda m
    JOIN transaccion t ON t.currency_id = m.currency_id
WHERE
    t.sender_user_id = 3;

-- 2. Obtener las transacciones realizadas por un usuario específico

SELECT t.*
FROM transaccion t
    JOIN usuarios u ON u.user_id = t.sender_user_id
WHERE
    t.sender_user_id = 2;

-- 3. Obtener todos los usuarios registrados

SELECT * FROM usuarios;
-- Consulta para obtener todas las monedas registradas
SELECT * FROM moneda;

-- 4. Obtener todas las transacciones registradas

SELECT * FROM transaccion;

-- 5. Obtener todas las transacciones realizadas por un usuario específico

SELECT t.*
FROM
    transaccion t
    JOIN usuarios sender ON t.sender_user_id = sender.user_id
    JOIN usuarios receiver ON t.receiver_user_id = receiver.user_id
WHERE
    sender.user_id = 3
    OR receiver.user_id = 3;

-- 6. Obtener todas las transacciones recibidas por un usuario específico

SELECT COUNT(*) AS transacciones
FROM transaccion t
    JOIN usuarios u ON u.user_id = t.receiver_user_id
WHERE
    t.receiver_user_id = 2;

-- 7. Sentencia DML para modificar el campo correo electrónico de un usuario específico

UPDATE usuarios
SET
    correo_electronico = 'cambiamos_correo@gmail.com'
WHERE
    user_id = 1;

-- 8. Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)

DELETE FROM transaccion WHERE transaccion_id = 1;

-- 9. Sentencia para DDL modificar el nombre de la columna correo_electronico por email

ALTER TABLE usuarios CHANGE correo_electronico email varchar(128);