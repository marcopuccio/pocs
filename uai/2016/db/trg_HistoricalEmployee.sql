-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[HistoricoEmpleadoCargo] 
   ON  [dbo].[Empleado] 
   AFTER UPDATE
AS 
IF ( UPDATE(id_cargo) )
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[HistoricoCargoEmpleado]
	SELECT i.id_empleado, d.id_cargo, i.id_cargo d FROM inserted AS I
	JOIN deleted AS D
	ON D.id_empleado = I.id_empleado

END
GO
