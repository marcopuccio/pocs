CREATE VIEW vw_ingreso_egreso_saldo_banco AS
SELECT 
	eb.cod_banco,
	eb.nombre,
	eb.Engresos,
	ib.Ingresos,
	(
		SELECT SUM(s.monto) 
		FROM fin_cuentas_bancarias_movimientos s 
		WHERE s.cod_banco=eb.cod_banco
	) as Saldo
FROM vw_egresos_bancos eb
JOIN vw_ingresos_bancos ib ON ib.cod_banco=eb.cod_banco
