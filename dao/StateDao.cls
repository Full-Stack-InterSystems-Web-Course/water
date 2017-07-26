Class dao.StateDao
{

ClassMethod readAll(ByRef status As %Status) As %ListOfObjects
{
	set status = $$$OK
	set list = ##class(%ListOfObjects).%New()
	try {
		
		&sql(declare StateCursor cursor for
			select ID
			from entity.State)
			
		&sql(open StateCursor)
		for {
			&sql(fetch StateCursor into :id)
			quit:(SQLCODE '= 0)
			do list.Insert(##class(entity.State).%OpenId(id))
		}
		&sql(close StateCursor)
	}
	catch (ex) {
		set status = ex.AsStatus()
	}
	quit list
}

ClassMethod riverLocation(ByVal statename,ByRef status ) As %ListOfDataTypes
{
	set status=$$$OK
	set list = ##class(%ListOfDataTypes).%New()
	try{
		&sql(declare RiverCursor cursor for
			select Locations
			from entity.RiverQuality 
			where State=statename )
			
		&sql(open RiverCursor)
		for{
			&sql(fetch RiverCursor into :loc)
			quit:(SQLCODE '=0)
			do list.Insert(loc)
		}
	}
	catch(ex)
	{
		set status = ex.AsStatus()
	}
	
	return list
}

}
