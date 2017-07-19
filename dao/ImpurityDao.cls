Class dao.ImpurityDao {
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
}