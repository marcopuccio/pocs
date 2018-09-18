-- Fecha:
select fecha from gasto where idGasto =4008
-- Resultado: "2018-08-07 00:00:00.000"


-- Sólo Año:
select year(fecha) from gasto where idgasto = 4008
-- Resultado: "2018"


-- Fecha con quincena formato "AAAAMMQ"
Select Case
  When day(fecha) < 15 then
  (year(fecha)*100 + month(fecha))*10 + 1
  else
  (year(fecha)*100 + month(fecha))*10 + 2
end
from gasto where idgasto = 4008
-- Resultado: "2018081"


--Fecha con formato "DD/MM/AA"
SELECT CONCAT(day(fecha),'/',month(fecha),'/',right(year(fecha),2))
from gasto where idgasto = 4008
-- Resultado: "7/8/18"
