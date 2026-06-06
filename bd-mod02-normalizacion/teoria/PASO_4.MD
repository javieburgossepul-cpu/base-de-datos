# TABLA
| Dato           | Depende de          |
| -------------- | ------------------- |
| cliente        | id_venta            |
| correo         | cliente             |
| ciudad_cliente | cliente             |
| vendedor       | id_venta            |
| producto       | id_venta            |

# ANALISIS
- Una venta pertenece a un cliende
- El correo depende del cliente
- La ciudad depende del cliente
- Una venta necesita de un vendedor
- Una venta requiere del producto que se va a vender