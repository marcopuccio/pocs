CREATE VIEW vw_ingresos_localidad AS
SELECT
	movs.cod_sucursal,
	locs.nombre,
	SUM(movs.monto) AS Ingresos
FROM fin_cuentas_bancarias_movimientos movs
JOIN sga_sucursales sucs ON movs.cod_sucursal=sucs.cod_sucursal
JOIN geo_localidades locs ON sucs.cod_sucursal=locs.cod_localidad
WHERE movs.monto > 0
GROUP BY movs.cod_sucursal, locs.nombre