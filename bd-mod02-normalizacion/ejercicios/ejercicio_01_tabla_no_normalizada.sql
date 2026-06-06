DROP TABLE IF EXISTS normalizacion.ventas_no_normalizadas; 
CREATE TABLE normalizacion.ventas_no_normalizadas ( 
    id_venta SERIAL PRIMARY KEY, cliente VARCHAR(100), 
    correo VARCHAR(120), productos TEXT, 
    ciudad_cliente VARCHAR(100), 
    vendedor VARCHAR(100) ); 
    
INSERT INTO normalizacion.ventas_no_normalizadas  (cliente, correo, productos, ciudad_cliente, vendedor) VALUES 
('Ana Torres', 'ana@mail.com', 'Mouse, Teclado, Monitor', 'Bogotá', 'Carlos'), 
('Luis Gómez', 'luis@mail.com', 'Laptop, Mouse', 'Medellín', 'Carlos'), 
('Ana Torres', 'ana@mail.com', 'Silla', 'Bogotá', 'Diana'); 

SELECT * FROM normalizacion.ventas_no_normalizadas; 