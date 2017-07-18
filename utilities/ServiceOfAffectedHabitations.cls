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
	 	 //set obj.state = statename
	 	 set nobj = ##class(entity.State).%New()
	 	 
	 	 set status = obj.%Save()
 	 }
}

}
