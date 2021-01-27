/****** External co-authors not from the US with email addresses along with co-author counts  ******/
/* Don Elsborg - ODA */
/* This includes GRID ID Instutitutions - from Dimensions */
/* Lots of rows since it can show every co-author identifier shows as it's own row */
/* also shows data source - can be used to evaluate our subscriptiions */
/* initial analysis shows emails only are available via the pubmed feed, AFAIK other data sources do NOT parse emails */
/* Comment out the email OR ID in the or clause to narrow the results */
SELECT DISTINCT [First Name], [Last Name], Email, prpa.[Full Address] 
       , (select count(*) from [Publication Record Person] where prp.[Publication Record ID] = [Publication Record ID]) as NumCoAuthors
	   , pr.[Data Source], a.[GRID Institution Name], prpi.Scheme, prpi.Value
	  FROM [Publication Record Person] prp
	  join   [Publication Record] pr
	  on  prp.[Publication Record ID] = pr.ID
	  join [Publication Record Person Address] prpa
	  on prp.ID = prpa.[Publication Record Person ID]
	  join Publication p
	  on pr.[Publication ID] = p.ID
	  join [Publication User Relationship] pu
	  on pu.[Publication ID] = p.ID
	  left join [Address] a
	  on a.[Address Hash] = prpa.[Address Hash]
	  left join [Publication Record Person Identifier] prpi
	  on prp.ID = prpi.[Publication Record Person ID]
	  where 
	  [ISO Country Code] != 'US'
	  and [Resolved User ID] is NULL
	-- Below uncomment either the direct EMAIL is not null OR the (Email OR prpi.[Index] is not Null)
        -- The first only displays entries with an email, the other one returns a much larger dataset 
          and   Email is not null 
         -- This next entry will return over a million rows because it also returns Identifiers from all data sources
          --  and  ( Email is not null OR prpi.[Index] is not null)
	  order by 5
