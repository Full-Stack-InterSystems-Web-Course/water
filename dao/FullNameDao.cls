Class dao.FullNameDao
{

ClassMethod readAll(ByRef status As %Status) As %ListOfDataTypes
{
	 set list= ##class(%ListOfDataTypes).%New()
	 &sql(declare fullname cursor for
	 	  select name,districtName->name,districtName->state->name
	      from entity.TownOrVillage  )
 	 &sql(open fullname)
 	 
 	 for
 	 { 	 &sql(fetch fullname into :townname,:districtname,:statename)
	 	 quit:(SQLCODE '= 0)
	 	 
	 	 set str=townname_"+"_districtname_"+"_statename
	 	 do list.Insert(str) 
	 	 //write list.Count()

 	 }
 	 &sql(close fullname )
		

 // 		set list= ##class(%ListOfDataTypes).%New()
 //				do list.Insert("Delhi+India")
 //				do list.Insert("Jabalpur+MadhyaPradesh")
 //				do list.Insert("Bhiwadi+Rajasthan")
 //				do list.Insert("Belgaum+Karnataka")
 	 return list
}

ClassMethod readByState(stname As %String, ByRef status As %Status) As %ListOfDataTypes
{
	 //write "Inside readByState",!
	 set list= ##class(%ListOfDataTypes).%New()
	 &sql(declare Bystatename cursor for
	 	  select name,state->name
	      from entity.District 
	      where state->name= :stname )
 	 &sql(open Bystatename)
 	 
 	 for
 	 { 	 &sql(fetch Bystatename into :districtname,:statename)
	 	 quit:(SQLCODE '= 0)
	 	 
	 	 set str=districtname_"+"_statename
	 	 do list.Insert(str) 
	 	 //write "readByState",!
	 	 //zwrite list
	 	 //write list.Count()

 	 }
 	 &sql(close Bystatename )

 	 return list
}

}
