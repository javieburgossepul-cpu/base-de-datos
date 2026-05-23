CREATE SCHEMA IF NOT EXISTS academia;

CREATE TABLE academia.estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro  DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE academia.cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    creditos INT NOT NULL CHECK (creditos > 0)
);  


CREATE TABLE academia.matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
    /*contsraints para mantener la integridad referencial entre las tablas estudiantes y cursos
    mantener la integridad inferencial es crucial para garantizar que los datos en la base de datos sean consistentes y 
    confiables. Al establecer claves foráneas con acciones de eliminación y actualización en cascada,
    se asegura que las relaciones entre las tablas se mantengan correctamente incluso cuando 
    se realizan cambios en los datos.
    */
    CONSTRAINT fk_estudiante FOREIGN KEY (id_estudiante) REFERENCES academia.estudiantes(id_estudiante) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES academia.cursos(id_curso) ON DELETE CASCADE ON UPDATE CASCADE
);
/*
#los indices pueden mejorar el rendimiento de las consultas, pero también pueden
# ralentizar las operaciones de inserción, actualización y eliminación, 
#ya que el índice debe actualizarse cada vez que se modifica la tabla. 
Por lo tanto, es importante evaluar cuidadosamente qué columnas deben
 ser indexadas en función de las consultas más comunes y el volumen de datos.*/
CREATE INDEX  idx_estudintes_correo ON academia.estudiantes(correo);
CREATE INDEX idx_cursos_codigo ON academia.cursos(codigo);
CREATE INDEX idx_matriculas_estudiante ON academia.matriculas(id_estudiante);

INSERT INTO academia.estudiantes (nombre, correo) VALUES
('Juan Pérez', 'juan.perez@example.com'), ('Ana Gómez', 'ana.gomez@example.com'),
 ('María Rodríguez', 'maria.rodriguez@example.com');

INSERT INTO academia.cursos (nombre, codigo, creditos) VALUES
('Matemáticas', 'MAT101', 4), ('Historia', 'HIS201', 3), ('Programación', 'PROG301', 5);

INSERT INTO academia.matriculas (id_estudiante, id_curso) VALUES
(1, 1), (1, 3), (2, 2), (3, 1), (3, 2), (3, 3); /* Ejemplo de matrículas para los estudiantes en los cursos (1,1) 
significa que el estudiante con ID 1 está matriculado en el curso con ID 1 */

/*indexar una columna es una técnica de optimización que mejora el rendimiento de las consultas al permitir 
un acceso más rápido a los datos.Un índice es una estructura de 
datos que almacena una copia ordenada de los valores de una columna */

