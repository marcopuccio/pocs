declare @fechaEntrada datetime;
set @fechaEntrada = '2016-08-05'
declare @minimo datetime;
declare @aux datetime;
declare @dayOfWeek int;
DECLARE @MyCursor CURSOR;
BEGIN
    SET @MyCursor = CURSOR FOR
    /*select 1 as 'dayOfWeek'
	union 
	select 2 as 'dayOfWeek'
	union 
	select 3 as 'dayOfWeek'  
	union */
	select 4 as 'dayOfWeek'  
	/*union 
	select 5 as 'dayOfWeek'  
	union 
	select 6 as 'dayOfWeek'  
	union 
	select 7 as 'dayOfWeek'*/

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @dayOfWeek

	select @minimo = case when @dayOfWeek = datepart(dw,@fechaEntrada) then
	@fechaEntrada
	else
		case when (@dayOfWeek - datepart(dw,@fechaEntrada)) > 3 then
			DATEADD(day,-((7+datepart(dw,@fechaEntrada))-@dayOfWeek),@fechaEntrada)
			 when (@dayOfWeek - datepart(dw,@fechaEntrada)) < -3 then
			DATEADD(day,(datepart(dw,@fechaEntrada)+@dayOfWeek)-7,@fechaEntrada)
		else
			DATEADD(day,@dayOfWeek - datepart(dw,@fechaEntrada),@fechaEntrada) 
		end
	end

    WHILE @@FETCH_STATUS = 0
    BEGIN
    
      select @aux = case when @dayOfWeek = datepart(dw,@fechaEntrada) then
	@fechaEntrada
	else
		case when (@dayOfWeek - datepart(dw,@fechaEntrada)) > 3 then
			DATEADD(day,-((7+datepart(dw,@fechaEntrada))-@dayOfWeek),@fechaEntrada)
			 when (@dayOfWeek - datepart(dw,@fechaEntrada)) < -3 then
			DATEADD(day,(datepart(dw,@fechaEntrada)+@dayOfWeek)-7,@fechaEntrada)
		else
			DATEADD(day,@dayOfWeek - datepart(dw,@fechaEntrada),@fechaEntrada) 
		end
	end

	select @minimo = case when abs(DATEDIFF(dw,@minimo,@fechaEntrada)) > abs(DATEDIFF(dw,@aux,@fechaEntrada)) then 
		@aux
		when abs(DATEDIFF(dw,@minimo,@fechaEntrada)) = abs(DATEDIFF(dw,@aux,@fechaEntrada)) then
			case when  @aux > @minimo then 
				@aux
			else
				@minimo 
			end
		else
			@minimo
		end

      FETCH NEXT FROM @MyCursor 
      INTO @dayOfWeek 
    END; 

	print 'Fecha de pago mas cercana: ' + Convert(varchar(50),@minimo,102)

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;