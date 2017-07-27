Class dao.DistrictDao
{

ClassMethod districts() As %Status
{
	 &sql(declare districts cursor for
	      select distinct stateName, districtName
	      into :statename,:districtname
	      from entity.AffectedWaterParameter)
 	 &sql(open districts)
 	 for
 	 {
	 	 &sql(fetch districts)
	 	 quit:(SQLCODE '= 0)
	 	 
	 	 set obj = ##class(entity.District).%New()
	 	 set obj.name = districtname
	 	 // wrong: set obj.state = statename
	 	// in the set of objects of the class State we need to find an object-state (it's Id) with the name  = statename
	 	// open this state object by Id
	 	 &sql( select ID
	 	 		into :id
	 	 		from entity.State
	 	 		where entity.State.name = :statename)
	 	 
	 	 set stateObj = ##class(entity.State).%OpenId(id)
	 	 set obj.state = stateObj
	 	 set status = obj.%Save()
 	 }
}

}
