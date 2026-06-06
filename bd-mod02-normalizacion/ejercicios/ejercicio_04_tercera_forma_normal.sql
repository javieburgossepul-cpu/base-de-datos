DROP TABLE IF EXISTS normalizacion.detalle_ventas_3fn CASCADE;
DROP TABLE IF EXISTS normalizacion.ventas_3fn CASCADE;
DROP TABLE IF EXISTS normalizacion.clientes_3fn CASCADE;
DROP TABLE IF EXISTS normalizacion.ciudades CASCADE;
DROP TABLE IF EXISTS normalizacion.departamentos CASCADE;
DROP TABLE IF EXISTS normalizacion.productos_3fn CASCADE;
DROP TABLE IF EXISTS normalizacion.vendedores_3fn CASCADE;

CREATE TABLE normalizacion.departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE normalizacion.ciudades (
    id_ciudad SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT NOT NULL,

    CONSTRAINT fk_ciudad_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES normalizacion.departamentos(id_departamento),

    CONSTRAINT uq_ciudad_departamento
        UNIQUE (nombre, id_departamento)
);

CREATE TABLE normalizacion.clientes_3fn (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,
    id_ciudad INT NOT NULL,

    CONSTRAINT fk_cliente_ciudad
        FOREIGN KEY (id_ciudad)
        REFERENCES normalizacion.ciudades(id_ciudad)
);

CREATE TABLE normalizacion.vendedores_3fn (
    id_vendedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE normalizacion.productos_3fn (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE normalizacion.ventas_3fn (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_venta DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_ventas_clientes_3fn
        FOREIGN KEY (id_cliente)
        REFERENCES normalizacion.clientes_3fn(id_cliente),

    CONSTRAINT fk_ventas_vendedores_3fn
        FOREIGN KEY (id_vendedor)
        REFERENCES normalizacion.vendedores_3fn(id_vendedor)
);

CREATE TABLE normalizacion.detalle_ventas_3fn (
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),

    PRIMARY KEY (id_venta, id_producto),

    CONSTRAINT fk_detalle_ventas_3fn
        FOREIGN KEY (id_venta)
        REFERENCES normalizacion.ventas_3fn(id_venta)
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_productos_3fn
        FOREIGN KEY (id_producto)
        REFERENCES normalizacion.productos_3fn(id_producto)
);

INSERT INTO normalizacion.departamentos (nombre)
VALUES
    ('Cundinamarca'),
    ('Antioquia');

INSERT INTO normalizacion.ciudades (nombre, id_departamento)
VALUES
    ('Bogotá', 1),
    ('Medellín', 2);

INSERT INTO normalizacion.clientes_3fn (nombre, correo, id_ciudad)
VALUES
    ('Ana Torres', 'ana@mail.com', 1),
    ('Luis Gómez', 'luis@mail.com', 2);

INSERT INTO normalizacion.vendedores_3fn (nombre)
VALUES
    ('Carlos'),
    ('Diana');

INSERT INTO normalizacion.productos_3fn (nombre)
VALUES
    ('Mouse'),
    ('Teclado'),
    ('Monitor'),
    ('Laptop'),
    ('Silla');

INSERT INTO normalizacion.ventas_3fn (id_cliente, id_vendedor, fecha_venta)
VALUES
    (1, 1, '2026-06-01'),
    (2, 1, '2026-06-02'),
    (1, 2, '2026-06-03');

INSERT INTO normalizacion.detalle_ventas_3fn (id_venta, id_producto, cantidad)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (2, 4, 1),
    (2, 1, 1),
    (3, 5, 1);

SELECT
    v.id_venta,
    c.nombre AS cliente,
    c.correo,
    ci.nombre AS ciudad,
    d.nombre AS departamento,
    ven.nombre AS vendedor,
    p.nombre AS producto,
    dv.cantidad,
    v.fecha_venta
FROM normalizacion.ventas_3fn v
JOIN normalizacion.clientes_3fn c
    ON v.id_cliente = c.id_cliente
JOIN normalizacion.ciudades ci
    ON c.id_ciudad = ci.id_ciudad
JOIN normalizacion.departamentos d
    ON ci.id_departamento = d.id_departamento
JOIN normalizacion.vendedores_3fn ven
    ON v.id_vendedor = ven.id_vendedor
JOIN normalizacion.detalle_ventas_3fn dv
    ON v.id_venta = dv.id_venta
JOIN normalizacion.productos_3fn p
    ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;