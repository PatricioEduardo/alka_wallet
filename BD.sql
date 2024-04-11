CREATE SCHEMA alka_wallet
DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
-- SI NO CORRE FAVOR DESCOMENTAR -- USE alka_wallet;

CREATE TABLE usuarios (
    user_id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100),
	pass VARCHAR(100),
    PRIMARY KEY (user_id)
    );
    
INSERT INTO usuarios (nombre, email, pass) VALUES ('Patricio Rivera', '1977', 'pr@gmail.com');
INSERT INTO usuarios (nombre, email, pass) VALUES ('Mariana Sandoval', '0210', 'mr@gmail.com');
INSERT INTO usuarios (nombre, email, pass) VALUES ('Inumundo Lelen', '7791', 'il@gmail.com');
INSERT INTO usuarios (nombre, email, pass) VALUES ('Maxi Aaron', '0904', 'ma@gmail.com');
INSERT INTO usuarios (nombre, email, pass) VALUES ('Lelen Inmundo', '0109', 'il@gmail.com');


CREATE TABLE transacciones (
    transaccion_id INT AUTO_INCREMENT,
    sender_user_id INT,
    receiver_user_id INT,
    monto DECIMAL(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (transaccion_id),
    FOREIGN KEY (sender_user_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES usuarios(user_id)
);
ALTER TABLE transacciones ADD currency_id INT, ADD FOREIGN KEY (currency_id) REFERENCES moneda(currency_id);

INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (1, 1, 1500.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (2, 1, 2500.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (3, 2, 3500.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (4, 3, 4500.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (5, 4, 5500.00);



CREATE TABLE moneda (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(200),
    currency_symbol CHAR(20)
);

INSERT INTO moneda (currency_name, currency_symbol) VALUES
('Dólar estadounidense', '$'),
('Euro', '€'),
('Yen japonés', '¥'),
('Libra esterlina', '£'),
('Dólar canadiense', 'CAD$'),
('Peso mexicano', 'MXN$'),
('Franco suizo', 'CHF'),
('Dólar australiano', 'AUD$'),
('Rupia india', '₹'),
('Real brasileño', 'R$');

