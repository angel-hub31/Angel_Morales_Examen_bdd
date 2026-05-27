
create table vuelos (
id SERIAL primary key,
codigo VARCHAR(10) not null unique,
precio_boleto NUMERIC(10,2) not null check (precio_boleto >= 0),
asientos_disponibles INTEGER not null check (asientos_disponibles >= 0)
);


--20 sentencias SQL de inserción (INSERT INTO).
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('AA-101', 250.50, 30);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('LA-202', 320.00, 12);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('IB-303', 450.75, 4);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('AV-404', 199.99, 20);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('CM-505', 380.00, 2);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('DL-606', 500.00, 0);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('UA-707', 275.80, 18);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('AF-808', 620.40, 3);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('KL-909', 410.25, 25);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('LH-111', 530.60, 1);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('EK-222', 890.00, 10);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('QR-333', 920.50, 0);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('BA-444', 480.00, 7);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('AM-555', 310.20, 15);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('AC-666', 405.90, 6);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('TK-777', 700.00, 4);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('QF-888', 980.45, 22);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('AZ-999', 365.70, 0);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('JL-121', 840.00, 9);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles)
VALUES ('NH-131', 760.30, 5);

select * from vuelos;

--1.3 Consultas SQL Requeridas

--Un SELECT para obtener todos los vuelos que 
--tengan menos de5 asientos disponibles.
SELECT * FROM vuelos WHERE asientos_disponibles < 5;

--Incremento de Tarifas: Un UPDATE que incremente el precio_boleto en un 15% para
--un vuelo específico identificado por su id.
UPDATE vuelos SET precio_boleto = precio_boleto * 1.15 WHERE id = 1;

--Depuración de Rutas Canceladas: Un DELETE para eliminar los vuelos que tengan
--exactamente 0 asientos disponibles (vuelos completamente llenos o cerrados).
DELETE FROM vuelos WHERE asientos_disponibles = 0;
