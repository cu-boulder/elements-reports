-- Find Publications with Journals referenced in Publications that do NOT have a real journal record.
select top 50 p.[ID],p.[Journal] from [Publication (Field Display Names)] p
where p.[Journal] not in (select [Title] from [Journal (Field Display Names)])
-- and p.[ID] = 255778  -- if you want to narrow down to a specific pub, uncomment this

-- The follow shows counts of the most frequent orphan journals
select  
p.[Journal], count(*) "num pubs"
from [Publication (Field Display Names)] p
where p.[Journal] not in (select [Title] from [Journal (Field Display Names)])
and p.[Journal ID] is NULL
group by p.[Journal]
order by 2 desc

-- The following is the list of all journal pubs for experts with null Journal
SELECT  [ID]
     ,[Title]
     ,[Book Title]
     ,[Abstract]
     ,[DOI]
     ,[Data Source]
     ,[Type]
     ,[ELEMENTS_DERIVED_PUB_DATE]
     ,[Authors]
     ,[Journal ID]
     ,[Journal]
     ,[Volume]
     ,[Issue]
     ,[Pagination Begin]
     ,[Pagination End]
     ,[Article number]
     ,[ISBN13]
     ,[Keywords]
 FROM [FISDB].[dbo].[experts-pubs]
 where [Journal ID] is NULL
 and [Type] = 'Journal article'
