SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE PopulateFlatTable
AS
BEGIN
	SET NOCOUNT ON;
	TRUNCATE TABLE TablaPlanaGeneral
	INSERT INTO TablaPlanaGeneral
	SELECT * FROM EXPORTAR_TABLA_PLANA
END
GO