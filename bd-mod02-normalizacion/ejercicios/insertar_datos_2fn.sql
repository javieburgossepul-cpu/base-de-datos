INSERT INTO normalizacion.clientes (nombre, correo, ciudad) VALUES 
('Ana Torres', 'ana@mail.com', 'Bogotá'), 
('Luis Gómez', 'luis@mail.com', 'Medellín'); 

INSERT INTO normalizacion.vendedores (nombre) VALUES 
('Carlos'), 
('Diana'); 

INSERT INTO normalizacion.productos (nombre) VALUES 
('Mouse'), 
('Teclado'), 
('Monitor'), 
('Laptop'), 
('Silla'); 

INSERT INTO normalizacion.ventas (id_cliente, id_vendedor, fecha_venta) VALUES 
(1, 1, '2026-06-01'), 
(2, 1, '2026-06-02'), 
(1, 2, '2026-06-03'); 

INSERT INTO normalizacion.detalle_ventas (id_venta, id_producto, cantidad) VALUES 
(1, 1, 1), 
(1, 2, 1), 
(1, 3, 1), 
(2, 4, 1), 
(2, 1, 1), 
(3, 5, 1); 