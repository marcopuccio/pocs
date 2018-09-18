SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Puccio
-- Create date: 12/09/2016
-- Description:	Create a table by the given name
-- =============================================
CREATE PROCEDURE sp_CrearTablaUnaDimension
	-- Add the parameters for the stored procedure here
	 @nombreTabla nvarchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @cmd AS NVARCHAR(max)
	SET @cmd = 'CREATE TABLE ' + @nombreTabla +
	' ( id_tabla [int] IDENTITY(1,1) NOT NULL, descrip [nvarchar](100) NULL )'
	EXEC sp_executesql @cmd
END
GO
