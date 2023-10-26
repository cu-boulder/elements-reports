select u.[Last First Name (cropped)], u.[Proprietary ID] FISID, u.[Home Department (cropped)], u.[Primary Group Descriptor], ppcnt "Pending publication count", puicnt "Pending Identifier Count", 
pu.pucnt "Claimed Publication Count", u.[Is Current Staff] from
[User] u
join
(select pp.[User ID] uid, count(*) ppcnt from [Pending Publication] pp group by pp.[User ID]) ppuid
on u.[ID] = ppuid.uid
left join
(select pui.[User ID] uid , count(*) puicnt from [Pending User Identifier] pui group by pui.[User ID]) pubuid
on u.[ID] = pubuid.uid
left join
(select pu.[User ID] uid, count(*) pucnt from [Publication User Relationship] pu group by pu.[User ID]) pu
on u.[ID] = pu.uid
where u.[Is Current Staff] = 1 and u.[Faculty Type] = 'Regular Faculty'
order by ppcnt desc
