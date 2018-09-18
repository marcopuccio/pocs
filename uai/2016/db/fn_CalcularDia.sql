-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
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
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[CalcularDiaDePago] 
(	
	@dia DATE
)
RETURNS date 
AS
BEGIN
	DECLARE @diadepago date,
	@nDiaDeSemana int,
	@loopAux int = -3,
	@valAux int,
	@sumAux int,
	@eqAux1 int,
	@eqAux2 int
	
	--SELECT @nDiaDeSemana = DATEPART(DW, @dia)
	set @nDiaDeSemana = DATEPART(DW, @dia)

	SELECT @diadepago = @dia FROM Dia WHERE disponible_pago = 1 AND id_dia = @nDiaDeSemana
	IF @diadepago IS NULL 
	BEGIN
		WHILE @loopAux <= 3
		BEGIN
			SELECT @valAux = @loopAux FROM Dia WHERE disponible_pago= 1 AND id_dia = (@nDiaDeSemana + @loopAux)
			
			IF @valAux IS NOT NULL
			BEGIN
				IF @sumAux IS NULL
				BEGIN
					set @sumAux = @loopAux
				END
				ELSE
				BEGIN
					IF ABS(@valAux) < ABS(@sumAux)
					BEGIN
						set @sumAux = @loopAux
					END
					ELSE IF ABS(@valAux) = ABS(@sumAux)
					BEGIN
						SELECT @eqAux1 = id_dia FROM Dia WHERE disponible_pago = 1 AND id_dia = (@nDiaDeSemana + @valAux)
						SELECT @eqAux2 = id_dia FROM Dia WHERE disponible_pago = 1 AND id_dia = (@nDiaDeSemana + @sumAux)
						IF @eqAux1 > @eqAux2
						BEGIN
							set @sumAux = @loopAux
						END
					END
				END
			END 
			set @valAux = NULL
			set @loopAux = @loopAux +1
		END
		set @diadepago = DATEADD(dd, @sumAux,@dia)
	END


	RETURN @diadepago
END
