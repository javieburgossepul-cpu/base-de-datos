CREATE TABLE academia.departamentos (     
    id_departamento SERIAL PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL UNIQUE );  



CREATE TABLE academia.profesores (
    id_profesor SERIAL PRIMARY KEY,
    id_departamento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,
    CONSTRAINT fk_profesor_departamento 
    FOREIGN KEY (id_departamento)       
    REFERENCES academia.departamentos(id_departamento)         
    ON DELETE RESTRICT         
    ON UPDATE CASCADE ); 

    SELECT  p.nombre AS profesor,
    p.correo,    
    d.nombre AS departamento 
    FROM academia.profesores p 
    JOIN academia.departamentos d     
    ON p.id_departamento = d.id_departamento; 