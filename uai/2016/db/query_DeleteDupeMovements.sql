-- =============================================
-- Author:		Marco Puccio
-- Description:	Elimina los registros duplicados
--				por legajo y datetime de mov. 
-- =============================================
delete from MovimientosRepetidos
where id not in ( 
	select  min(id)
	from MovimientosRepetidos
	group by legajo, movimiento
)