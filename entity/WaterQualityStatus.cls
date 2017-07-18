/// Class has values of impurity content in different areas of India where the river flows
Class entity.WaterQualityStatus Extends %Persistent [ StorageStrategy = "" ]
{

/// State Code
Property a As %Integer(CAPTION = "State Code");

/// Water Quality
Property b As %String(CAPTION = "Water Quality");

/// Locations
Property c As %String(CAPTION = "Locations");

/// State Name
Property d As %String(CAPTION = "State Name");

/// TEMPERATURE (degree Centigrade)-Minimum
Property e As %Double(CAPTION = "TEMPERATURE (degree Centigrade)-Minimum");

/// TEMPERATURE (degree Centigrade)-Maximum
Property f As %Double(CAPTION = "TEMPERATURE (degree Centigrade)-Maximum");

/// TEMPERATURE (degree Centigrade)-Mean
Property g As %Double(CAPTION = "TEMPERATURE (degree Centigrade)-Mean");

/// Dissolved Oxygen(D.O.) (mg/l)-Minimum
Property h As %Double(CAPTION = "Dissolved Oxygen(D.O.) (mg/l)-Minimum");

/// Dissolved Oxygen(D.O.) (mg/l)-Maximum
Property i As %Double(CAPTION = "Dissolved Oxygen(D.O.) (mg/l)-Maximum");

/// Dissolved Oxygen(D.O.) (mg/l)-Mean
Property j As %Double(CAPTION = "Dissolved Oxygen(D.O.) (mg/l)-Mean");

/// pH-Minimum
Property k As %Double(CAPTION = "pH-Minimum");

/// pH-Maximum
Property l As %Double(CAPTION = "pH-Maximum");

/// pH-Mean
Property m As %Double(CAPTION = "pH-Mean");

/// Unknown1
Property n As %Double(CAPTION = "Unknown1");

/// Unknown2
Property o As %Double(CAPTION = "Unknown2");

/// Unknown3
Property p As %Double(CAPTION = "Unknown3");

/// Biochemical oxygen demand (B.O.D.) (mg/l)-Minimum
Property q As %Double(CAPTION = "Biochemical oxygen demand (B.O.D.) (mg/l)-Minimum");

/// Biochemical oxygen demand (B.O.D.) (mg/l)-Maximum
Property r As %Double(CAPTION = "Biochemical oxygen demand (B.O.D.) (mg/l)-Maximum");

/// Biochemical oxygen demand (B.O.D.) (mg/l)-Mean
Property s As %Double(CAPTION = "Biochemical oxygen demand (B.O.D.) (mg/l)-Mean");

/// NITRATE- N (mg/l)-Minimum
Property t As %Double(CAPTION = "NITRATE- N (mg/l)-Minimum");

/// NITRATE- N (mg/l)-Maximum
Property u As %Double(CAPTION = "NITRATE- N (mg/l)-Maximum");

/// NITRATE- N (mg/l)-Mean
Property v As %Double(CAPTION = "NITRATE- N (mg/l)-Mean");

/// NITRITE-N (mg/l)-Minimum
Property w As %Double(CAPTION = "NITRITE-N (mg/l)-Minimum");

/// NITRITE-N (mg/l)-Maximum
Property x As %Double(CAPTION = "NITRITE-N (mg/l)-Maximum");

/// NITRITE-N (mg/l)-Mean
Property y As %Double(CAPTION = "NITRITE-N (mg/l)-Mean");

/// FECAL COLIFORM (MPN/100ml)-Minimum
Property z As %Double(CAPTION = "FECAL COLIFORM (MPN/100ml)-Minimum");

/// FECAL COLIFORM (MPN/100ml)-Maximum
Property za As %Double(CAPTION = "FECAL COLIFORM (MPN/100ml)-Maximum");

/// FECAL COLIFORM (MPN/100ml)-Mean
Property zb As %Double(CAPTION = "FECAL COLIFORM (MPN/100ml)-Mean");

/// TOTAL COLIFORM (MPN/100ml)-Minimum
Property zc As %Double(CAPTION = "TOTAL COLIFORM (MPN/100ml)-Minimum");

/// TOTAL COLIFORM (MPN/100ml)-Maximum
Property zd As %Double(CAPTION = "TOTAL COLIFORM (MPN/100ml)-Maximum");

/// TOTAL COLIFORM (MPN/100ml)-Mean
Property ze As %Double(CAPTION = "TOTAL COLIFORM (MPN/100ml)-Mean");

}
