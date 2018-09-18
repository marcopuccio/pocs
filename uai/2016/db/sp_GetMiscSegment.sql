SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================
-- Author:		Marco Puccio
-- Create date: 12/09/2016
-- Description:	Returns misc rows filtered by key
-- ==============================================
CREATE PROCEDURE sp_RegistrosMiscellaneous 
	-- Add the parameters for the stored procedure here
	@claveMisc nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Miscellaneous WHERE clave_misc = @claveMisc
END
GO
