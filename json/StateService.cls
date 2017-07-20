Class json.StateService
{

/// create a JSON object from State properties
ClassMethod CopyToJsonObject(state As entity.State) As %DynamicObject
{
 
	set object = {}
	set object.ID = state.%Id()
	set object.statename = state.name
	return object
}

/// copy a JSON object into State properties
ClassMethod CopyFromJsonbject(object As %DynamicObject) As entity.State
{
	set state = ##class(entity.State).%New(object.name)
	return state
}

ClassMethod readAll() As %Status
{
	// get all states and convert them to json - json array of json objects
	set list = ##class(dao.StateDao).readAll(.status)
	
	set returnJsonObj ={}
	set jsonArray = []
	for i = 1:1:list.Count(){
		set obj = ..CopyToJsonObject(list.GetAt(i))
		do jsonArray.%Push(obj)
	}
	
	set returnJsonObj.states = jsonArray
	write returnJsonObj.%ToJSON()
	return $$$OK
}

ClassMethod readAllTowns() As %Status
{
	// get all states and convert them to json - json array of json objects
	set list = ##class(dao.FullNameDao).readAll(.status )
	set returnJsonObj ={}
	set jsonArray = []
	for i = 1:1:list.Count(){
		do jsonArray.%Push(list.GetAt(i))
	}
	
	set returnJsonObj.names = jsonArray
	write returnJsonObj.%ToJSON()
	return $$$OK
}

ClassMethod readByState(ByVal statename As %String ) As %Status
{
	//w "statename = ", statename,!
	// get all states and convert them to json - json array of json objects
	set list = ##class(dao.FullNameDao).readByState(statename,.status )
	//w "status = ", $system.Status.DisplayError(status),!
	set returnJsonObj ={}
	set jsonArray = []
	for i = 1:1:list.Count(){
		do jsonArray.%Push(list.GetAt(i))
	}
	
	set returnJsonObj.names = jsonArray
	write returnJsonObj.%ToJSON()
	return $$$OK
}

ClassMethod readDataAtDistrict(ByVal distname As %String ) As %Status
{
   
	set list=##class(dao.TownImpurityDao).waterImpurityInDistrict(distname,.status )
	set returnJsonObj ={}
	set jsonArray = []
	for i = 1:1:list.Count(){
		do jsonArray.%Push(list.GetAt(i))
	}
	
	set returnJsonObj.impurityName = jsonArray
	write returnJsonObj.%ToJSON()
	return $$$OK
}

}
