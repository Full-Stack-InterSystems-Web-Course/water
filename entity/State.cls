Class entity.State Extends %Persistent
{

Property name As %String;

Storage Default
{
<Data name="StateDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>^entity.StateD</DataLocation>
<DefaultData>StateDefaultData</DefaultData>
<IdLocation>^entity.StateD</IdLocation>
<IndexLocation>^entity.StateI</IndexLocation>
<StreamLocation>^entity.StateS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
