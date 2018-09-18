SELECT DISTINCT
 NP.fecha_nota_pedido,
 C.nombre_completo,
 V.nombre
 --T.descripcion_documento,
 --( T.prefijo + ' - ' + Convert( nvarchar(50), D.numero_documento )),
 --C.nombre_completo,
 --TTL.tf
FROM dbo.NotaPedido NP
JOIN dbo.Cliente C on C.id_cliente = NP.id_cliente
JOIN dbo.Empleado V on V.id_empleado = NP.id_vendedor
/* JOIN dbo.ProductoPrecio PP on DD.id_producto = PP.id_producto
JOIN dbo.Producto P on P.id_producto = PP.id_producto
JOIN dbo.Documento D on DD.id_documento = D.id_documento
JOIN dbo.TipoDocumento T ON T.id_tipo_documento = D.id_tipo_documento
JOIN dbo.NotaPedido NP on D.id_nota_pedido = NP.id_nota_pedido

JOIN (select dd.id_documento, sum(precio_producto) tf 
      from ProductoPrecio PP
      JOIN DetalleDocumento DD on pp.id_producto = dd.id_producto
      group by dd.id_documento ) AS TTL ON TTL.id_documento = D.id_documento
	  */