Class entity.TownOrVillage Extends %Persistent
{

Property name As %String;

Property districtName As entity.District;

Storage Default
{
<Data name="TownOrVillageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>districtName</Value>
</Value>
</Data>
<DataLocation>^entity.TownOrVillageD</DataLocation>
<DefaultData>TownOrVillageDefaultData</DefaultData>
<IdLocation>^entity.TownOrVillageD</IdLocation>
<IndexLocation>^entity.TownOrVillageI</IndexLocation>
<StreamLocation>^entity.TownOrVillageS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
