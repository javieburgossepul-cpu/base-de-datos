DROP TABLE IF EXISTS normalizacion.detalle_ventas CASCADE; 

DROP TABLE IF EXISTS normalizacion.ventas CASCADE; 
DROP TABLE IF EXISTS normalizacion.productos CASCADE; 
DROP TABLE IF EXISTS normalizacion.vendedores CASCADE; 
DROP TABLE IF EXISTS normalizacion.clientes CASCADE; 

CREATE TABLE normalizacion.clientes ( 
    id_cliente SERIAL PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL, 
    correo VARCHAR(120) UNIQUE NOT NULL, 
    ciudad VARCHAR(100) NOT NULL 
    ); 

CREATE TABLE normalizacion.vendedores ( 
    id_vendedor SERIAL PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL UNIQUE 
    ); 
    
CREATE TABLE normalizacion.productos (     
    id_producto SERIAL PRIMARY KEY,     
    nombre VARCHAR(100) NOT NULL UNIQUE 
    
);  

CREATE TABLE normalizacion.ventas (     
    id_venta SERIAL PRIMARY KEY,     
    id_cliente INT NOT NULL,     
    id_vendedor INT NOT NULL,    
    fecha_venta DATE NOT NULL DEFAULT CURRENT_DATE,      
    CONSTRAINT fk_ventas_clientes  FOREIGN KEY (id_cliente) REFERENCES normalizacion.clientes(id_cliente),
    CONSTRAINT fk_ventas_vendedores FOREIGN KEY (id_vendedor) REFERENCES normalizacion.vendedores(id_vendedor) 
    );  
    
    CREATE TABLE normalizacion.detalle_ventas (     
        id_venta INT NOT NULL,     
        id_producto INT NOT NULL,     
        cantidad INT NOT NULL CHECK (cantidad > 0),      
        PRIMARY KEY (id_venta, id_producto), 

        CONSTRAINT fk_detalle_ventas    
        FOREIGN KEY (id_venta)         
        REFERENCES normalizacion.ventas(id_venta)         
        ON DELETE CASCADE,      
        
        CONSTRAINT fk_detalle_productos         
        FOREIGN KEY (id_producto)         
        REFERENCES normalizacion.productos(id_producto) ); 