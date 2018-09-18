USE [SI II]
GO
/****** Object:  UserDefinedFunction [dbo].[CalcularDiaDePago]    Script Date: 5/23/2016 8:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery2.sql|7|0|C:\Users\Facu\AppData\Local\Temp\~vs8FC2.sql

ALTER FUNCTION [dbo].[CalcularDiaDePago] 
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

	SELECT @diadepago = @dia FROM DiaDePago WHERE activado_diadepago = 1 AND numero_diadepago = @nDiaDeSemana
	IF @diadepago IS NULL 
	BEGIN
		WHILE @loopAux <= 3
		BEGIN
			SELECT @valAux = @loopAux FROM DiaDePago WHERE activado_diadepago = 1 AND numero_diadepago = (@nDiaDeSemana + @loopAux)
			
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
						SELECT @eqAux1 = numero_diadepago FROM DiaDePago WHERE activado_diadepago = 1 AND numero_diadepago = (@nDiaDeSemana + @valAux)
						SELECT @eqAux2 = numero_diadepago FROM DiaDePago WHERE activado_diadepago = 1 AND numero_diadepago = (@nDiaDeSemana + @sumAux)
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