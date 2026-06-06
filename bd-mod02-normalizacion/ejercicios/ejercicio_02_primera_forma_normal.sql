DROP TABLE IF EXISTS normalizacion.ventas_1fn; 

CREATE TABLE normalizacion.ventas_1fn ( 
    id_venta INT, cliente VARCHAR(100), 
    correo VARCHAR(120), producto VARCHAR(100), 
    ciudad_cliente VARCHAR(100), vendedor VARCHAR(100) 
    ); 
    
    INSERT INTO normalizacion.ventas_1fn (id_venta, cliente, correo, producto, ciudad_cliente, vendedor) VALUES 
    (1, 'Ana Torres', 'ana@mail.com', 'Mouse', 'Bogotá', 'Carlos'), 
    (1, 'Ana Torres', 'ana@mail.com', 'Teclado', 'Bogotá', 'Carlos'), 
    (1, 'Ana Torres', 'ana@mail.com', 'Monitor', 'Bogotá', 'Carlos'), 
    (2, 'Luis Gómez', 'luis@mail.com', 'Laptop', 'Medellín', 'Carlos'), 
    (2, 'Luis Gómez', 'luis@mail.com', 'Mouse', 'Medellín', 'Carlos'), 
    (3, 'Ana Torres', 'ana@mail.com', 'Silla', 'Bogotá', 'Diana'); 
    
    SELECT * FROM normalizacion.ventas_1fn;