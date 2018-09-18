CREATE VIEW vw_ingresos_bancos AS
SELECT 
	movs.cod_banco,
	bank.nombre,
	SUM(movs.monto) as Ingresos
FROM fin_cuentas_bancarias_movimientos movs
JOIN sga_bancos bank ON bank.cod_banco=movs.cod_banco
WHERE movs.monto > 0
GROUP BY movs.cod_banco, bank.nombre
