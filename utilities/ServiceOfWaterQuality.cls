Class utilities.ServiceOfWaterQuality
{

/// we should take information from initial data (AffectedWaterParameters) about states
ClassMethod states() As %Status
{
	 &sql(declare states cursor for
	      select distinct d
	      from entity.WaterQualityStatus)
 	 &sql(open states)
 	 for
 	 {
	 	 &sql(fetch states into :name)
	 	 quit:(SQLCODE '= 0)
	 	 set status = $$$OK
	 	 set nameCheck = ##class(dao.StateDao).readByName(name,.status)
	 	 if ('$isobject(namecheck)) 
	 	 {
	 	 	set obj = ##class(entity.State).%New()
	 	 	set obj.name = name
	 	 	set status = obj.%Save()
	 	 }
 	 }
}

ClassMethod stateImpurityData(state As %String) As %String
{
		&sql(declare data cursor for
		select  JSON_OBJECT('e' : e,'f' : f, 'g' : g, 'h' : h, 'i' : i, 'j' : j, 'k' : k, 'l' : l,
		 'm' : m, 'n' : n, 'o' : o, 'p' : p, 'q' : q, 'r' : r, 's' : s, 't' : t, 'u' : u, 'v' : v, 'w' : w, 'x' : x,
		  'y' : y, 'z' : z, 'za' : za, 'zb' : zb, 'zc' : zc, 'zd' : zd, 'ze' : ze) into 
		myJSONString from entity.WaterQualityStatus where :state = entity.WaterQualityStatus.d)                
	
	  &sql(open data)
	
	  &sql(fetch data)
	  return myJSONString
}
}