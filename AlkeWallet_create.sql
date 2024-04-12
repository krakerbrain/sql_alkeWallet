CREATE DATABASE IF NOT EXISTS `alke_wallet`;

USE `alke_wallet`;

CREATE TABLE `usuarios` (
    `user_id` int NOT NULL AUTO_INCREMENT, `nombre` varchar(256) DEFAULT NULL, `correo_electronico` varchar(128) DEFAULT NULL, `contrasenia` varchar(100) NOT NULL, `saldo` float DEFAULT NULL, `fecha_creacion` timestamp NULL DEFAULT NULL, PRIMARY KEY (`user_id`)
);

CREATE TABLE `moneda` (
    `currency_id` int NOT NULL AUTO_INCREMENT, `currency_name` varchar(126) NOT NULL, `currency_symbol` varchar(10) NOT NULL, PRIMARY KEY (`currency_id`)
);

CREATE TABLE `transaccion` (
    `transaccion_id` int NOT NULL AUTO_INCREMENT, `sender_user_id` int DEFAULT NULL, `receiver_user_id` int DEFAULT NULL, `importe` float DEFAULT NULL, `transaction_date` timestamp NULL DEFAULT NULL, `currency_id` int DEFAULT NULL, PRIMARY KEY (`transaccion_id`), KEY `fk_sender_user_id_idx` (`sender_user_id`), KEY `fk_receiver_user_id_idx` (`receiver_user_id`), KEY `fk_currency_id_idx` (`currency_id`), CONSTRAINT `fk_sender_user_id` FOREIGN KEY (`sender_user_id`) REFERENCES `usuarios` (`user_id`), CONSTRAINT `fk_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `moneda` (`currency_id`), CONSTRAINT `fk_receiver_user_id` FOREIGN KEY (`receiver_user_id`) REFERENCES `usuarios` (`user_id`)
);

INSERT INTO
    `usuarios`
VALUES (
        1, 'Mario Montenegro', 'cambiamos_correo@gmail.com', '123456', 5000, '2024-05-02 14:00:00'
    ),
    (
        2, 'Carlos González', 'carlos@gmail.com', '123456', 5000, '2024-05-02 14:00:01'
    ),
    (
        3, 'Karlos Lagos', 'karlos@gmail.com', '123456', 5000, '2024-05-02 14:00:01'
    ),
    (
        4, 'Juan Pérez', 'juanperez@example.com', '123456', 10000, '2024-04-11 19:54:20'
    ),
    (
        5, 'María García', 'mariag@example.com', '124356', 20000, '2024-04-11 19:54:20'
    ),
    (
        6, 'Pedro Martínez', 'pedrito82@example.com', '123465', 30000, '2024-04-11 19:54:20'
    ),
    (
        7, 'Laura Rodríguez', 'lauritarod@example.com', '123546', 40000, '2024-04-11 19:54:20'
    ),
    (
        8, 'Carlos Sánchez', 'carlitos007@example.com', '123564', 50000, '2024-04-11 19:54:20'
    ),
    (
        9, 'Ana López', 'analopez88@example.com', '123645', 60000, '2024-04-11 19:54:20'
    ),
    (
        10, 'Luis Hernández', 'luish89@example.com', '123654', 70000, '2024-04-11 19:54:20'
    ),
    (
        11, 'Sofía Díaz', 'sofiad@example.com', '124356', 80000, '2024-04-11 19:54:20'
    ),
    (
        12, 'Diego González', 'diegogon@example.com', '124365', 90000, '2024-04-11 19:54:20'
    ),
    (
        13, 'Elena Martín', 'elena.martin@example.com', '124536', 100000, '2024-04-11 19:54:20'
    );

INSERT INTO
    `moneda`
VALUES (1, 'Peso', 'CLP'),
    (2, 'Dolar', 'USD'),
    (3, 'Euro', 'EUR');

INSERT INTO
    `transaccion`
VALUES (
        1, 1, 2, 500, '2024-04-11 20:03:10', 1
    ),
    (
        2, 3, 4, 700, '2024-04-11 20:03:10', 2
    ),
    (
        3, 5, 6, 200, '2024-04-11 20:03:10', 3
    ),
    (
        4, 7, 8, 800, '2024-04-11 20:03:10', 1
    ),
    (
        5, 9, 10, 600, '2024-04-11 20:03:10', 2
    ),
    (
        6, 11, 12, 300, '2024-04-11 20:03:10', 3
    ),
    (
        7, 2, 3, 450, '2024-04-11 20:03:10', 1
    ),
    (
        8, 4, 5, 550, '2024-04-11 20:03:10', 2
    ),
    (
        9, 6, 7, 350, '2024-04-11 20:03:10', 3
    ),
    (
        10, 8, 9, 900, '2024-04-11 20:03:10', 1
    );