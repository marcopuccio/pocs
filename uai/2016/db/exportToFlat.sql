SELECT
	doc.abonado, doc.id_documento,  
	doc.id_nota_pedido, np.fecha_nota_pedido, 
	np.id_cliente, cli.direccion, 
	cli.dni, cli.fecha_nacimiento, 
	cli.email, cli.nombre_completo, 
	cli.ocupacion, cli.sexo,
	np.id_vendedor, emp.id_cargo, 
	carg.descripcion, emp.nombre,
	doc.id_tipo_documento, tdoc.descripcion_documento,
	doc.id_sucursal, suc.descripcion,
	suc.direccion, prod.descripcion,
	pprod.precio_producto, ddoc.cantidad_producto
FROM Documento doc
JOIN DetalleDocumento ddoc ON doc.id_documento=ddoc.id_documento
JOIN NotaPedido np ON np.id_nota_pedido=doc.id_nota_pedido
JOIN Cliente cli ON cli.id_cliente=np.id_cliente
JOIN Empleado emp ON emp.id_empleado=np.id_vendedor
JOIN Cargo carg ON emp.id_cargo=carg.id_cargo
JOIN TipoDocumento tdoc ON tdoc.id_tipo_documento=doc.id_tipo_documento
JOIN Sucursal suc ON suc.id_sucursal=doc.id_sucursal
JOIN ProductoPrecio pprod ON pprod.id_producto_precio=ddoc.id_producto
JOIN Producto prod ON pprod.id_producto=prod.id_producto
