DROP TABLE IF EXISTS calificaciones CASCADE;
DROP TABLE IF EXISTS evaluaciones CASCADE;
DROP TABLE IF EXISTS grupos CASCADE;
DROP TABLE IF EXISTS asignaturas CASCADE;
DROP TABLE IF EXISTS estudiantes CASCADE;
DROP TABLE IF EXISTS docentes CASCADE;

CREATE TABLE docentes ( 
    id_docente SERIAL PRIMARY KEY, 
    usuario VARCHAR(50) UNIQUE NOT NULL, 
    password_hash VARCHAR(255) NOT NULL, 
    nombre VARCHAR(100) NOT NULL, 
    apellido VARCHAR(100) NOT NULL, 
    email VARCHAR(150) UNIQUE NOT NULL, 
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE estudiantes ( 
    id_estudiante SERIAL PRIMARY KEY, 
    cifEstudiante VARCHAR(20) UNIQUE NOT NULL, 
    nombre VARCHAR(100) NOT NULL, 
    apellido VARCHAR(100) NOT NULL, 
    email VARCHAR(150) UNIQUE 
);

CREATE TABLE asignaturas ( 
    id_asignatura SERIAL PRIMARY KEY, 
    codigo_asignatura VARCHAR(20) UNIQUE NOT NULL, 
    nombre VARCHAR(150) NOT NULL, 
    descripcion TEXT 
);

CREATE TABLE grupos ( 
    id_grupo SERIAL PRIMARY KEY, 
    codigo_grupo VARCHAR(20) UNIQUE NOT NULL, 
    id_asignatura INT NOT NULL, 
    id_docente INT NOT NULL, 
    periodo_academico VARCHAR(20) NOT NULL, 

    CONSTRAINT fk_grupos_asignatura 
        FOREIGN KEY (id_asignatura) 
        REFERENCES asignaturas(id_asignatura) 
        ON DELETE CASCADE, 

    CONSTRAINT fk_grupos_docente 
        FOREIGN KEY (id_docente) 
        REFERENCES docentes(id_docente) 
        ON DELETE CASCADE 
);

CREATE TABLE evaluaciones ( 
    id_evaluacion SERIAL PRIMARY KEY, 
    id_grupo INT NOT NULL, 
    nombre VARCHAR(100) NOT NULL, 
    porcentaje NUMERIC(5,2) 
        CHECK (porcentaje > 0 AND porcentaje <= 100), 
    fecha_evaluacion DATE, 
    estado VARCHAR(20) DEFAULT 'PENDIENTE' 
        CHECK (estado IN ('PENDIENTE', 'ACTIVO', 'FINALIZADA')), 

    CONSTRAINT fk_evaluaciones_grupo 
        FOREIGN KEY (id_grupo) 
        REFERENCES grupos(id_grupo) 
        ON DELETE CASCADE 
);

CREATE TABLE calificaciones ( 
    id_calificacion SERIAL PRIMARY KEY, 
    id_evaluacion INT NOT NULL, 
    id_estudiante INT NOT NULL, 
    nota NUMERIC(4,2) NOT NULL 
        CHECK (nota >= 0.00 AND nota <= 10.00), 
    estado VARCHAR(20) DEFAULT 'BORRADOR' 
        CHECK (estado IN ('BORRADOR', 'PUBLICADO')), 
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 

    CONSTRAINT fk_calificaciones_evaluacion 
        FOREIGN KEY (id_evaluacion) 
        REFERENCES evaluaciones(id_evaluacion) 
        ON DELETE CASCADE, 

    CONSTRAINT fk_calificaciones_estudiante 
        FOREIGN KEY (id_estudiante) 
        REFERENCES estudiantes(id_estudiante) 
        ON DELETE CASCADE, 

    CONSTRAINT uq_evaluacion_estudiante 
        UNIQUE (id_evaluacion, id_estudiante) 
);

INSERT INTO docentes (usuario, password_hash, nombre, apellido, email) 
VALUES ('admin', '123456', 'Santiago', 'Sánchez', 'santiago@portal.edu');

INSERT INTO estudiantes (cifEstudiante, nombre, apellido, email) 
VALUES 
    ('EST001', 'Carlos', 'Gómez', 'carlos.gomez@estudiantil.edu'), 
    ('EST002', 'Ana', 'Martínez', 'ana.martinez@estudiantil.edu'), 
    ('EST003', 'Luis', 'Hernández', 'luis.hernandez@estudiantil.edu');

INSERT INTO asignaturas (codigo_asignatura, nombre, descripcion) 
VALUES ('MAT101', 'Programación Web I', 'Fundamentos de HTML, CSS y JavaScript');

INSERT INTO grupos (codigo_grupo, id_asignatura, id_docente, periodo_academico) 
VALUES ('GRP-A1', 1, 1, '2026-2');

INSERT INTO evaluaciones (id_grupo, nombre, porcentaje, fecha_evaluacion, estado) 
VALUES (1, 'Examen Parcial 1', 35.00, '2026-08-20', 'ACTIVO');

INSERT INTO calificaciones (id_evaluacion, id_estudiante, nota, estado) 
VALUES 
    (1, 1, 8.50, 'BORRADOR'), 
    (1, 2, 9.00, 'BORRADOR'), 
    (1, 3, 7.50, 'BORRADOR');

SELECT * FROM docentes; 
SELECT * FROM estudiantes; 
SELECT * FROM asignaturas; 
SELECT * FROM grupos; 
SELECT * FROM evaluaciones; 
SELECT * FROM calificaciones;