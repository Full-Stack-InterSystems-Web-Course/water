Class entity.TownOrVillageImpurity Extends %Persistent
{

Property name As TownOrVillage;

Property impurity As WaterImpurity;

Storage Default
{
<Data name="TownOrVillageImpurityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>impurity</Value>
</Value>
</Data>
<DataLocation>^entity.TownOrVillageImpurityD</DataLocation>
<DefaultData>TownOrVillageImpurityDefaultData</DefaultData>
<IdLocation>^entity.TownOrVillageImpurityD</IdLocation>
<IndexLocation>^entity.TownOrVillageImpurityI</IndexLocation>
<StreamLocation>^entity.TownOrVillageImpurityS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

