SELECT Prod.descripcion,
	   MiscType.descripcion,
	   MiscColor.descripcion
FROM dbo.Producto Prod
JOIN Miscelaneous MiscType ON Prod.tipo_producto = MiscType.id_misc
JOIN Miscelaneous MiscColor ON Prod.color_producto = MiscColor.id_misc