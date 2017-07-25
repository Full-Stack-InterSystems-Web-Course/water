Class dao.TownDao {
ClassMethod townsOrVillages() As %Status
{
	 &sql(declare townsOrVillages cursor for
	      select distinct villageName , districtName
	      into :townname ,:districtname
	      from entity.AffectedWaterParameter)
 	 &sql(open townsOrVillages)
 	 for
 	 {
	 	 &sql(fetch townsOrVillages)
	 	 quit:(SQLCODE '= 0)
	 	 
	 	 set obj = ##class(entity.TownOrVillage).%New()
	 	 set obj.name = townname
	 	 // wrong: set obj.state = statename
	 	// in the set of objects of the class State we need to find an object-state (it's Id) with the name  = statename
	 	// open this state object by Id
	 	 &sql( select ID
	 	 		into :id
	 	 		from entity.District
	 	 		where entity.District.name = :districtname)
	 	 
	 	 set districtObj = ##class(entity.District).%OpenId(id)
	 	 set obj.districtName = districtObj
///test
	 	 set status = obj.%Save()
 	 }
}
}