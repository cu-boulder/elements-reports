SELECT 
--TOP 1000 
u.[Is Local], u.[Is Login Allowed], u.[Data Source],
st.[User ID]
,st.[Affiliation]
,st.[Author]
--,count(pp.[ID]) as "Num Pending Pubs"
FROM [User Search Term Defaults] st, [User] u --left join [Pending Publication] pp on pp.[User ID] = u.ID
where 
--st.Author like '%-%' and -- this restricts it to authors with hyphens
st.[User ID] = u.[ID]
and u.[Is Current Staff] = 1
and u.[Is Local] = 0
--and[User ID] = 1324
and (upper(st.[Affiliation]) not like '%BOULDER%' or st.[Affiliation] is null)
--where contains([Author],'Li')
----group by st.[User ID], st.Affiliation, st.Author
order by 4 desc
