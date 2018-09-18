SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Puccio
-- Create date: 12/09/2016
-- Description: Returns the last day of the
--              month by the given Datetime
-- =============================================
CREATE FUNCTION UltimoDiaMes
(
	-- Add the parameters for the function here
	@fechaEvento DATETIME
)
RETURNS DATETIME
AS
BEGIN
	RETURN DATEADD (dd, -1, DATEADD(mm, DATEDIFF(mm, 0, convert(datetime, @fechaEvento)) + 1, 0))
END
GO

