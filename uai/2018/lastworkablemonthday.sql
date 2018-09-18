
set datefirst 1;

with dia as (
  select
  cast('01/01/2016' as date) as fecha
  union all
  select
  dateadd(d, 1, fecha) as fecha
  from
  dia
  where
  fecha < '31/12/2025'
)
select *
from
  dia
where
  fecha = case
    when datepart(dw, eomonth(fecha)) = 7 then dateadd(day, -2, eomonth(fecha))
    when datepart(dw, eomonth(fecha)) = 6 then dateadd(day, -1, eomonth(fecha))
    else
      eomonth(fecha)
    end
