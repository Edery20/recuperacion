--	Desarrolle un trigger que cobre un dólar por cada día que fue prestada una película, 
--es decir, cuando se entregue la película por parte del cliente al llenarse el valor “FECHAENTREGA”,
--automáticamente se calcula el campo “VALOR”.
create or replace function valor() returns trigger
as $valor$
    declare
		fecha DATE;
		precio int;
begin
		select FECHAPRESTAMO into fecha from alquiler where IDALQUILER = new.IDALQUILER;		
		select into precio extract(days from (new.FECHAENTREGA::date)) - extract(days from (fecha ::date));		
		update alquiler set VALOR=precio where IDALQUILER = new.IDALQUILER;    
        return new;	
end;
$valor$
language plpgsql;


create trigger valorTrigger after update
on alquiler for each row
WHEN (pg_trigger_depth() = 0) --evitando la recursividad
execute procedure valor();


--comprobacion
update alquiler set FECHAENTREGA='10/09/2021'  where IDALQUILER=1;
