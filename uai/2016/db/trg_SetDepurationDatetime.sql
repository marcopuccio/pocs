USE [dbo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Puccio
-- Create date: 12-09-2016	
-- Description:	Trigger to set the depuration 
--              date to a new row inserted. This
--              date will be the last day of the
--              month set in 'fecha_event'
-- =============================================
ALTER TRIGGER [dbo].[trg_SetFechaDepuracion]
   ON  [dbo].[remito_trazabilidad]
   AFTER INSERT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	UPDATE remito_trazabilidad
	SET fecha_depuracion = dbo.UltimoDiaMes(fecha_evento)
END