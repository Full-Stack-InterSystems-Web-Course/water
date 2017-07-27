/// Dispatch class
Class web.REST Extends %CSP.REST
{
 // ClassMethod OnHandleOptionsRequest(pUrl As %String) as %Status
 //{
 //	 Set tOrigin=$Get(%request.CgiEnvs("HTTP_ORIGIN"))
 //	 Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Origin",tOrigin) 
 //	 Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Credentials","true")
 //	 Set tHeaders=$Get(%request.CgiEnvs("HTTP_ACCESS_CONTROL_REQUEST_HEADERS"))
 //     Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Headers",tHeaders)
 //     Set tMethod=$Get(%request.CgiEnvs("HTTP_ACCESS_CONTROL_REQUEST_METHOD"))
 //     Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Method",tMethod)
 //	
 //}


XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- ================================== -->
<!-- To test the access to the REST app -->
<!-- ================================== -->
<Route Url="/test" Method="GET" Call="test" Cors="true"/> 
<Route Url="/json" Method="GET" Call="json" Cors="true"/>
<!-- ======================================= -->
<!-- Work with the entity "State"            -->
<!-- ======================================= -->
<!-- Get all states -->
<Route Url="/states" Method="GET" Call="json.StateService:readAll" Cors="true"/>
<Route Url="/towns" Method="GET" Call="json.StateService:readAllTowns" Cors="true"/>
<Route Url="/districts/:name" Method="GET" Call="json.StateService:readByState" Cors="true"/>
<Route Url="/impurity/:name" Method="GET" Call="json.StateService:readDataAtDistrict" Cors="true" />
<Route Url="/river" Method="POST" Call="json.StateService:readLocationOfRiver" Cors="true" />
<Route Url="/index" Method="POST" Call="json.StateService:IndexCalculator" Cors="true" />
<Route Url="/indexI" Method="POST" Call="json.StateService:IndexCalculatorLoc" Cors="true" />

<!-- Get table of water quality in the Selected state -->
<Route Url="/waterstate/:name" Method="GET" Call="json.StateService:readWaterState"/>
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
    set jsonState = ##class(json.StateService).CopyToJsonObject(state)
	write jsonState.%ToJSON()
	quit $$$OK
}

}