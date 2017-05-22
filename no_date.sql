select p.ID, p.[Data Source], p.Type
from [Publication User Relationship] pu, [Publication (Field Display Names)] p
where  p.ID = pu.[Publication ID]
and (p.[Publication date] is NULL and p.[Conference start date] IS NULL
 and p.[Publication date or Presentation Date] IS NULL and p.[Reporting Date 1] is NULL)
