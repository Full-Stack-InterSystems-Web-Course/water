/// Dispatch class
Class web.REST Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- ================================== -->
<!-- To test the access to the REST app -->
<!-- ================================== -->
<Route Url="/test" Method="GET" Call="test"/> 
<Route Url="/json" Method="GET" Call="json"/>
<!-- ======================================= -->
<!-- Work with the entity "TownOrVillage"    -->
<!-- ======================================= -->
<!-- Get all states -->
<Route Url="/states" Method="GET" Call="json.StateService:readAll"/>
</Routes>
}

/// ================================
///  A temporary method to test the access to the class REST
/// ================================
/// http://localhost:57772/water/api/test
ClassMethod test() As %Status
{
    &html<It works!>
    quit $$$OK
}

/// ================================
///  A temporary method to test the getting data in json
/// ================================
/// http://localhost:57772/water/api/json
ClassMethod json() As %Status
{
    set state = ##class(entity.State).%New()
    set state.name = "Manipur"
///	write state.name, !
	set jsonState = {}
	set jsonState = ##class(json.StateService).CopyToJsonObject(state)
	write jsonState.%ToJSON()
	quit $$$OK
}

}
