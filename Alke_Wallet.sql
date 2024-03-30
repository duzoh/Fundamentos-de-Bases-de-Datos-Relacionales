CREATE DATABASE Alke_Wallet; 

USE Alke_Wallet; 

CREATE TABLE usuarios(
    user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    contraseña VARCHAR(20) NOT NULL,
    saldo INT,
    fecha_creacion DATE NOT NULL,
    currency_id INT,
    FOREIGN KEY (currency_id) REFERENCES moneda (currency_id)
);
 
CREATE TABLE transaccion1(
    transaction_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sender_user_id INT,
    receiver_user_id INT,
    currency_id INT,
    FOREIGN KEY (sender_user_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES usuarios(user_id),
	FOREIGN KEY (currency_id) REFERENCES moneda(currency_id),
    valor INT,
    trasaction_date DATE NOT NULL 
);

CREATE TABLE moneda(
    currency_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(10) 
);

INSERT INTO usuarios(user_id, nombre, correo_electronico, contraseña, saldo, fecha_creacion,currency_id)
VALUES
    (NULL, 'Marisol', 'ejemplocorreo1', '1234', 9990, now(), 1),
    (NULL, 'Ismael', 'ejemplocorreo2', '1235', 15990, now(), 3),
    (NULL, 'Alejandro', 'ejemplocorreo3', '1236', 2990, now(), 2),
    (NULL, 'Johanna', 'ejemplocorreo4', '1236', 2990, now(), 2),
    (NULL, 'Natalia', 'ejemplocorreo5', '1236', 2990, now(), 1),
    (NULL, 'Jose', 'ejemplocorreo6', '1236', 2990, now(), 3),
    (NULL, 'Alva', 'ejemplocorreo7', '1236', 2990, now(), 2);
    
 
INSERT INTO transaccion
VALUES 
    (NULL,1,3,2,50000,now()),
    (NULL,7,2,2,30000,now()),
    (NULL,3,5,2,279000,now()),
    (NULL,1,2,1,303000,now()),
    (NULL,1,3,3,269000,now()),
    (NULL,7,6,1,162000,now()),
    (NULL,5,3,2,74500,now()),
    (NULL,1,4,1,50000,now()),
    (NULL,4,3,1,2000,now()),
    (NULL,2,1,1,70000,now());
    
INSERT INTO moneda(currency_id, currency_name,currency_symbol)
VALUES 
    (NULL, 'peso', 'p'),
    (NULL, 'dolar', '$'),
    (NULL, 'euro', 'e');

--  Consulta para obtener el nombre de la moneda elegida por un usuario específico

select m.currency_name from moneda m
INNER JOIN usuarios u ON u.currency_id = m.currency_id 
WHERE u.nombre = 'Jose'; 

--  Consulta para obtener todas las transacciones registradas

SELECT * FROM transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico

select u.nombre, t.* from transaccion t
INNER JOIN usuarios u ON u.user_id = t.sender_user_id AND t.receiver_user_id
WHERE u.user_id = 3;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico

UPDATE usuarios
SET correo_electronico ='nuevo_correo_Marisol' 
WHERE nombre = 'Marisol';

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)

DELETE FROM transaccion 
WHERE valor <= 1000; 
