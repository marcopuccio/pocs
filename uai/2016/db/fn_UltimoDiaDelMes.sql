-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
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
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION UltimoDiaDelMes 
(
	-- Add the parameters for the function here
	@month INT,
	@year INT
)
RETURNS DATETIME
AS
BEGIN
	-- Declare the return variable here
	DECLARE @parsedDate DATETIME = '1/' + CONVERT(nvarchar(2), @month) + '/' + CONVERT(nvarchar(4), @year)
	-- Return the last day of the given month and year.
	RETURN EOMONTH(@parsedDate)

END
GO

