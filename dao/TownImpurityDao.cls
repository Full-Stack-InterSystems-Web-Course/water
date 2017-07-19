Class dao.TownImpurityDao {
ClassMethod townOrVillageImpurity() As %Status
{
	 &sql(declare townImpurity cursor for
	      select distinct villageName , qualityParameter
	      into :townname ,:impurity
	      from entity.AffectedWaterParameter)
 	 &sql(open townImpurity)
 	 for
 	 {
	 	 &sql(fetch townImpurity)
	 	 quit:(SQLCODE '= 0)
	 	 
	 	 set obj = ##class(entity.TownOrVillageImpurity).%New()
	 	
	 	 // wrong: set obj.state = statename
	 	// in the set of objects of the class State we need to find an object-state (it's Id) with the name  = statename
	 	// open this state object by Id
	 	 &sql( select ID
	 	 		into :id1
	 	 		from entity.WaterImpurity
	 	 		where entity.WaterImpurity.name = :impurity)
	 	 &sql( select ID
	 	 		into :id2
	 	 		from entity.TownOrVillage
	 	 		where entity.TownOrVillage.name = :townname)
	 	 
	 	 set impurityObj = ##class(entity.WaterImpurity).%OpenId(id1)
	 	 set townObj = ##class(entity.TownOrVillage).%OpenId(id2)
		 set obj.name = townObj
	 	 set obj.impurity = impurityObj
	 	 set status = obj.%Save()
 	 }
}
}