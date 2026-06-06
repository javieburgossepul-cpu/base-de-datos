SELECT
    v.id_venta,
    c.nombre AS cliente,
    c.correo,
    vd.nombre AS vendedor,
    p.nombre AS producto,
    dv.cantidad,
    v.fecha_venta
FROM normalizacion.ventas v
JOIN normalizacion.clientes c
    ON v.id_cliente = c.id_cliente
JOIN normalizacion.vendedores vd
    ON v.id_vendedor = vd.id_vendedor
JOIN normalizacion.detalle_ventas dv
    ON v.id_venta = dv.id_venta
JOIN normalizacion.productos p
    ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;