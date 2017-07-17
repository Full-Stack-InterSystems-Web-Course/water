/// Objects of the class are the satates of India
Class domain.State Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property name As %String(CAPTION = "My Caption");

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
<DataLocation>^domain.StateD</DataLocation>
<DefaultData>StateDefaultData</DefaultData>
<IdLocation>^domain.StateD</IdLocation>
<IndexLocation>^domain.StateI</IndexLocation>
<StreamLocation>^domain.StateS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
