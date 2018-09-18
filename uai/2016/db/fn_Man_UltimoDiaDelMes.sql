SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Marco Puccio>
-- Description:	<Devuelve el ultimo dia del mes>
-- =============================================
CREATE FUNCTION [dbo].[NonFunc_UltimoDiaDelMes] 
(
    @mes INT,
	@anio INT
)
RETURNS DATETIME
AS
BEGIN
	
	DECLARE @mesSiguente INT = @mes + 1
	DECLARE @primerDiaMesSiguiente as DATETIME = (CONVERT(nvarchar(4), @anio) + '-' + CONVERT(nvarchar(2), @mesSiguente) + '-01' )
	RETURN DATEADD(dd, -1, @primerDiaMesSiguiente)
END