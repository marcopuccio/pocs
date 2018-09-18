SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Puccio
-- Create date: 12-09-2016
-- Description:	Remove the chars loaded in table
--              from the given string. 
-- =============================================
CREATE FUNCTION EliminarCaracteres 
(
	@toReplaceString nvarchar(500)
)
RETURNS nvarchar(500)
AS
BEGIN
	SELECT @toReplaceString = REPLACE(@toReplaceString, C.caracter, '') 
    FROM dbo.Caracteres C
	RETURN @toReplaceString
END
GO
