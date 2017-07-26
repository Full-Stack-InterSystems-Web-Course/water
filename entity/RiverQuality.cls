Class entity.RiverQuality Extends %Persistent
{

Property StationCode As %Numeric [ SqlColumnNumber = 2 ];

Property Locations As %String [ SqlColumnNumber = 3 ];

Property State As %String [ SqlColumnNumber = 4 ];

Property TempMIN As %Numeric [ SqlColumnNumber = 5 ];

Property TemperatureMAX As %Numeric [ SqlColumnNumber = 6 ];

Property TemperatureMEAN As %Numeric [ SqlColumnNumber = 7 ];

Property DisolvedOxygenMIN As %Library.Numeric [ SqlColumnNumber = 8 ];

// mg/l

Property DisolvedOxygenMAX As %Library.Numeric [ SqlColumnNumber = 9 ];

// mg/l

Property DisolvedOxygenMEAN As %Library.Numeric [ SqlColumnNumber = 10 ];

// mg/l

Property pHMIN As %Library.Numeric [ SqlColumnNumber = 11 ];

Property pHMAX As %Library.Numeric [ SqlColumnNumber = 12 ];

Property pHMEAN As %Library.Numeric [ SqlColumnNumber = 13 ];

Property ConductivityMIN As %Library.Numeric [ SqlColumnNumber = 14 ];

Property ConductivityMAX As %Library.Numeric [ SqlColumnNumber = 15 ];

Property ConductivityMEAN As %Library.Numeric [ SqlColumnNumber = 16 ];

Property BODMIN As %Library.Numeric [ SqlColumnNumber = 17 ];

// Biochemical Oxygen Demand

Property BODMAX As %Library.Numeric [ SqlColumnNumber = 18 ];

// Biochemical Oxygen Demand

Property BODMEAN As %Library.Numeric [ SqlColumnNumber = 19 ];

// Biochemical Oxygen Demand

Property NitrateNitriteMIN As %Library.Numeric [ SqlColumnNumber = 20 ];

Property NitrateNitriteMAX As %Library.Numeric [ SqlColumnNumber = 21 ];

Property NitrateNitriteMEAN As %Library.Numeric [ SqlColumnNumber = 22 ];

Property FecalColiformMIN As %Library.Numeric [ SqlColumnNumber = 23 ];

Property FecalColiformMAX As %Library.Numeric [ SqlColumnNumber = 24 ];

Property FecalColiformMEAN As %Library.Numeric [ SqlColumnNumber = 25 ];

Property TotalColiformMIN As %Library.Numeric [ SqlColumnNumber = 26 ];

Property TotalColiformMAX As %Library.Numeric [ SqlColumnNumber = 27 ];

Property TotalColiformMEAN As %Library.Numeric [ SqlColumnNumber = 28 ];

Storage Default
{
<Data name="RiverQualityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>StationCode</Value>
</Value>
<Value name="3">
<Value>Locations</Value>
</Value>
<Value name="4">
<Value>State</Value>
</Value>
<Value name="5">
<Value>TempMIN</Value>
</Value>
<Value name="6">
<Value>TemperatureMAX</Value>
</Value>
<Value name="7">
<Value>TemperatureMEAN</Value>
</Value>
<Value name="8">
<Value>DisolvedOxygenMIN</Value>
</Value>
<Value name="9">
<Value>DisolvedOxygenMAX</Value>
</Value>
<Value name="10">
<Value>DisolvedOxygenMEAN</Value>
</Value>
<Value name="11">
<Value>pHMIN</Value>
</Value>
<Value name="12">
<Value>pHMAX</Value>
</Value>
<Value name="13">
<Value>pHMEAN</Value>
</Value>
<Value name="14">
<Value>ConductivityMIN</Value>
</Value>
<Value name="15">
<Value>ConductivityMAX</Value>
</Value>
<Value name="16">
<Value>ConductivityMEAN</Value>
</Value>
<Value name="17">
<Value>BODMIN</Value>
</Value>
<Value name="18">
<Value>BODMAX</Value>
</Value>
<Value name="19">
<Value>BODMEAN</Value>
</Value>
<Value name="20">
<Value>NitrateNitriteMIN</Value>
</Value>
<Value name="21">
<Value>NitrateNitriteMAX</Value>
</Value>
<Value name="22">
<Value>NitrateNitriteMEAN</Value>
</Value>
<Value name="23">
<Value>FecalColiformMIN</Value>
</Value>
<Value name="24">
<Value>FecalColiformMAX</Value>
</Value>
<Value name="25">
<Value>FecalColiformMEAN</Value>
</Value>
<Value name="26">
<Value>TotalColiformMIN</Value>
</Value>
<Value name="27">
<Value>TotalColiformMAX</Value>
</Value>
<Value name="28">
<Value>TotalColiformMEAN</Value>
</Value>
</Data>
<DataLocation>^entity.RiverQualityD</DataLocation>
<DefaultData>RiverQualityDefaultData</DefaultData>
<IdLocation>^entity.RiverQualityD</IdLocation>
<IndexLocation>^entity.RiverQualityI</IndexLocation>
<StreamLocation>^entity.RiverQualityS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
