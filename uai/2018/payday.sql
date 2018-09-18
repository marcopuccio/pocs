USE [Rodo]
GO
/****** Object:  UserDefinedFunction [dbo].[DiaPago]    Script Date: 5 Sept. 2016 4:52:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[DiaPago]
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

	SELECT @nDiaDeSemana = DATEPART(DW, @dia)

	SELECT @diadepago = @dia FROM DiaDePago WHERE id_diadepago = @nDiaDeSemana
	IF @diadepago IS NULL
	BEGIN
		WHILE @loopAux <= 3
		BEGIN
			SELECT @valAux = @loopAux FROM DiaDePago WHERE id_diadepago = (@nDiaDeSemana + @loopAux)

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
						SELECT @eqAux1 = id_diadepago FROM DiaDePago WHERE id_diadepago = (@nDiaDeSemana + @valAux)
						SELECT @eqAux2 = id_diadepago FROM DiaDePago WHERE id_diadepago = (@nDiaDeSemana + @sumAux)
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
