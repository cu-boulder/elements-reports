select u.[Last Name], u.[First Name], u.[Proprietary ID] as "FISID" 
--, up.[User ID], pu.ID as "PU.ID" ,pr.ID as "PR.ID", 
,pr.[Publication ID] as "Pub ID"
--, up.[Publication ID] 
,up.[Preferred Record ID], pr.[Title (cropped)], pr.[Publication date] as "Preferred Pub Date",
 p.[Publication date] as "Pub-date", pr.[Data Source] 

from [User] u, [Publication Record] pr, [Publication User Relationship] pu, [Publication] p left join  [User Publication Preferences] up
	on   up.[Publication ID] = p.ID -- and up.[User ID] = pu.[User ID])

where 
-- pr.[Publication ID] = 45113 and
pr.[Data Source] = 'ArXiv' and
pu.[Publication ID] = pr.[Publication ID]
and p.[ID] = pr.[Publication ID]
and pu.[User ID] = up.[User ID]
and u.[ID] = pu.[User ID]
order by 3 
