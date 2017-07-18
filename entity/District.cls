Class entity.District Extends %Persistent
{

Property name As %String;

Property state As State;

Storage Default
{
<Data name="DistrictDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>state</Value>
</Value>
</Data>
<DataLocation>^entity.DistrictD</DataLocation>
<DefaultData>DistrictDefaultData</DefaultData>
<IdLocation>^entity.DistrictD</IdLocation>
<IndexLocation>^entity.DistrictI</IndexLocation>
<StreamLocation>^entity.DistrictS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
