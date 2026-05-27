---PARTE 4

CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dias_estimados INTEGER NOT NULL CHECK (dias_estimados > 0)
);

select * from proyectos;



CREATE TABLE tecnologias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL
);

select * from tecnologias;

CREATE TABLE proyectos_tecnologias (
    id_proyecto INTEGER NOT NULL,
    id_tecnologia INTEGER NOT NULL,
    PRIMARY KEY (id_proyecto, id_tecnologia),
    CONSTRAINT fk_proyecto FOREIGN KEY (id_proyecto) 
        REFERENCES proyectos(id) ON DELETE CASCADE,
    CONSTRAINT fk_tecnologia FOREIGN KEY (id_tecnologia) 
        REFERENCES tecnologias(id) ON DELETE CASCADE
);


select * from proyectos_tecnologias;


INSERT INTO proyectos (nombre, dias_estimados) VALUES
('E-Commerce Avanzado', 90),
('App Móvil Delivery', 60),
('Sistema de Inventario', 45),
('Plataforma Web Educativa', 75);

-- Insertar datos en la tabla tecnologias
INSERT INTO tecnologias (nombre, categoria) VALUES
('Java', 'Backend'),
('Python', 'Backend'),
('React', 'Frontend'),
('PostgreSQL', 'Base de Datos'),
('MySQL', 'Base de Datos'),
('TypeScript', 'Frontend');

INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES
(1, 1), 
(1, 3), 
(1, 4), 

(2, 2), 
(2, 5), 

(3, 1), 
(3, 4), 

(4, 6), 
(4, 3), 
(4, 5);



SELECT t.nombre, t.categoria
FROM tecnologias t
JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
JOIN proyectos p ON p.id = pt.id_proyecto
WHERE p.nombre = 'Nombre Del Proyecto';


SELECT p.nombre, p.dias_estimados
FROM proyectos p
JOIN proyectos_tecnologias pt ON p.id = pt.id_proyecto
WHERE pt.id_tecnologia = 1;



SELECT t.nombre AS tecnologia, COUNT(pt.id_proyecto) AS total_proyectos
FROM tecnologias t
LEFT JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
GROUP BY t.id, t.nombre
ORDER BY total_proyectos DESC;

