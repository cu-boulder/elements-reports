-- Find Publications with Journals referenced in Publications that do NOT have a real journal record.
select top 50 p.[ID],p.[Journal] from [Publication (Field Display Names)] p
where p.[Journal] not in (select [Title] from [Journal (Field Display Names)])
-- and p.[ID] = 255778  -- if you want to narrow down to a specific pub, uncomment this
