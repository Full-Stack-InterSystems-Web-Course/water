Class utilities.ServiceOfAffectedHabitations
{

/// we should take information from initial data (AffectedWaterParameters) about states
ClassMethod states() As %Status
{
	 &sql(declare states cursor for
	      select distinct stateName
	      into :name
	      from entity.AffectedWaterParameter)
 	 &sql(open states)
 	 for
 	 {
	 	 &sql(fetch states)
	 	 quit:(SQLCODE '= 0)
	 	 
	 	 set obj = ##class(entity.State).%New()
	 	 set obj.name = name
	 	 set status = obj.%Save()
 	 }
}

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
	 	 set status = obj.%Save()
 	 }
}

ClassMethod waterImpurity() As %Status
{
	 &sql(declare impurity cursor for
	      select distinct qualityParameter
	      into :name
	      from entity.AffectedWaterParameter)
 	 &sql(open impurity)
 	 for
 	 {
	 	 &sql(fetch impurity)
	 	 quit:(SQLCODE '= 0)
	 	 
	 	 set obj = ##class(entity.WaterImpurity).%New()
	 	 set obj.name = name
	 	 set status = obj.%Save()
 	 }
}

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
