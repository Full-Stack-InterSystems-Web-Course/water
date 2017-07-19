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

}
