Class entity.WaterImpurity Extends %Persistent
{

Property name As %String;
//comment

Storage Default
{
<Data name="WaterImpurityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>^entity.WaterImpurityD</DataLocation>
<DefaultData>WaterImpurityDefaultData</DefaultData>
<IdLocation>^entity.WaterImpurityD</IdLocation>
<IndexLocation>^entity.WaterImpurityI</IndexLocation>
<StreamLocation>^entity.WaterImpurityS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
