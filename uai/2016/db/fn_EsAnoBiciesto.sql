SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Puccio
-- Description:	Verifica si es año biciesto.
--	            Devuelve 0 o 1.
-- =============================================
CREATE FUNCTION EsAnoBiciestio (@year INT)
RETURNS INT
AS
BEGIN
RETURN(IIF(DATEPART(dd,(EOMONTH(CONCAT(@year,'0201')))) = 29,1,0))
END
GO

