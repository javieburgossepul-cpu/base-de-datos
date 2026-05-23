-- Creación de la tabla estudiantes
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);

-- Creación de la tabla cursos
CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Creación de la tabla matriculas con claves foráneas e integridad referencial
CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
    
    -- SI SE ELIMINA UN ESTUDIANTE, SE ELIMINARAN AUTOMATICAMENTE TODAS SUS MATRICULAS
    -- SI SE ACTUALIZA EL ID_ESTUDIANTE EN LA TABLA ESTUDIANTES, SE ACTUALIZARA AUTOMATICAMENTE EN LA TABLA MATRICULAS
    CONSTRAINT fk_estudiante 
        FOREIGN KEY (id_estudiante) 
        REFERENCES estudiantes(id_estudiante) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_curso 
        FOREIGN KEY (id_curso) 
        REFERENCES cursos(id_curso) 
        ON DELETE CASCADE
);