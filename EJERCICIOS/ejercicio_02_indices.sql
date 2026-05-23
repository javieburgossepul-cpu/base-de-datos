EXPLAIN SELECT * FROM academia.profesores WHERE correo = 'profesor1@correo.com';
CREATE INDEX idx_profesores_correo ON academia.profesores(correo); 
EXPLAIN SELECT * FROM academia.profesores WHERE correo = 'profesor1@correo.com'; 