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

ClassMethod riverLocation(statename, ByRef status) As %ListOfDataTypes
{
	set status=$$$OK
	set list = ##class(%ListOfDataTypes).%New()
	try{
		&sql(declare RiverCursor cursor for
			select Locations
			from entity.RiverQuality 
			where State=:statename )
			
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

ClassMethod PurityParameter(statename, ByRef status) As %Numeric
{
	set status=$$$OK
	set mean=0
	try{
		&sql(declare RiverCursor2 cursor for
			select phMEAN,NitrateNitriteMEAN,DisolvedOxygenMEAN,FecalColiformMEAN
			from entity.RiverQuality 
			where State=:statename )
		set sum=0
		set count=0
		&sql(open RiverCursor2)
		for{
			&sql(fetch RiverCursor2 into :ph,:ni,:do,:fcol)
			quit:(SQLCODE '=0)
			set a=##class(utilities.ServiceOfRiverQuality).IndexCalc(ph, ni , do, fcol) 
			set sum=sum+a
			set count=count+1
		}
		&sql(close RiverCursor2)
		set mean=sum/count
	}
	catch(ex)
	{
		set status = ex.AsStatus()
	}
	
	return mean
}


ClassMethod PurityParameterLoc(location, ByRef status) As %Numeric
{
	set status=$$$OK
	set mean=0
	try{
		&sql(declare RiverCursor3 cursor for
			select phMEAN,NitrateNitriteMEAN,DisolvedOxygenMEAN,FecalColiformMEAN
			from entity.RiverQuality 
			where Locations=:location )
		set sum=0
		set count=0
		&sql(open RiverCursor3 )
		for{
			&sql(fetch RiverCursor3 into :ph,:ni,:do,:fcol)
			quit:(SQLCODE '=0)
			set a=##class(utilities.ServiceOfRiverQuality).IndexCalc(ph, ni , do, fcol) 
			set sum=sum+a
			set count=count+1
		}
		&sql(close RiverCursor3 )
		set mean=sum/count
	}
	catch(ex)
	{
		set status = ex.AsStatus()
	}
	
	return mean 
}

ClassMethod readWaterState(ByVal name As %String, ByRef status As %Status) As %ListOfObjects
{
    set status = $$$OK
  set list = ##class(%ListOfObjects).%New()
  try {
    
    &sql(declare WaterStateCursor cursor for
      select ID
      from entity.WaterQualityStatus where d = :name)
      
    &sql(open WaterStateCursor)
    for {
      &sql(fetch WaterStateCursor into :id)
      quit:(SQLCODE '= 0)
      do list.Insert(##class(entity.WaterQualityStatus).%OpenId(id))
    }
    &sql(close WaterStateCursor)
  }
  catch (ex) {
    set status = ex.AsStatus()
  }
  
  quit list
}

}
