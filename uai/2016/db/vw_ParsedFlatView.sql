SELECT
	np.tipodocumento, np.letra, np.sucursal,
	np.numero, np.id_cliente, cli.razon_soc,
	cli.id_localidad, loc.localidad, cli.id_tipo_cli,
	tcli.descripcion, np.id_articulo, art.descripcion, 
	convert(float, replace(art.costo,',','.')), art.id_marca, mar.marca,
	art.id_segmento, seg.segmento, np.fecha,
	np.cantidad, convert(float, replace(np.precio,',','.'))
FROM notapedido np 
JOIN articulo art ON np.id_articulo = art.id_articulo
JOIN marca mar ON art.id_marca=mar.id_marca
JOIN segmento seg ON art.id_segmento=seg.id_segmento
JOIN cliente cli ON np.id_cliente=cli.id_cliente
JOIN localidad loc ON cli.id_localidad=loc.id_localidad
JOIN tipocliente tcli ON cli.id_tipo_cli=tcli.id_tipo_cli
