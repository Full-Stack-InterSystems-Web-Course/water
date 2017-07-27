Class entity.AffectedWaterParameter Extends %Persistent
{

Property stateName As %String;

Property districtName As %String;

Property blockName As %String;

Property panchayatName As %String;

Property villageName As %String;

Property habitationName As %String;

Property qualityParameter As %String;

Property year As %String;

Storage Default
{
<Data name="AffectedWaterParameterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>stateName</Value>
</Value>
<Value name="3">
<Value>districtName</Value>
</Value>
<Value name="4">
<Value>blockName</Value>
</Value>
<Value name="5">
<Value>panchayatName</Value>
</Value>
<Value name="6">
<Value>villageName</Value>
</Value>
<Value name="7">
<Value>habitationName</Value>
</Value>
<Value name="8">
<Value>qualityParameter</Value>
</Value>
<Value name="9">
<Value>year</Value>
</Value>
</Data>
<DataLocation>^entity.AffectedWaterParameterD</DataLocation>
<DefaultData>AffectedWaterParameterDefaultData</DefaultData>
<IdLocation>^entity.AffectedWaterParameterD</IdLocation>
<IndexLocation>^entity.AffectedWaterParameterI</IndexLocation>
<StreamLocation>^entity.AffectedWaterParameterS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
