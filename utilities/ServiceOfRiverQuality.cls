Class utilities.ServiceOfRiverQuality
{

ClassMethod CreateArrays() As %Status
{
   //set ^Parameters("DO",10)=8
   set ^DO(10)=8
   set ^DO(20)=13
   set ^DO(30)=20
   set ^DO(40)=30
   set ^DO(50)=43
   set ^DO(60)=56
   set ^DO(70)=77
   set ^DO(80)=88
   set ^DO(85)=92
   set ^DO(90)=95
   set ^DO(95)=97.5
   set ^DO(100)=99
   set ^DO(105)=98
   set ^DO(110)=95
   set ^DO(120)=90
   set ^DO(130)=85
   set ^DO(140)=78
   set ^DO(141)=50
   
   set ^PH(1)=0
   set ^PH(2)=2
   set ^PH(3)=4
   set ^PH(4)=8
   set ^PH(5)=24
   set ^PH(6)=55
   set ^PH(7)=90
   set ^PH(7.2)=92
   set ^PH(7.5)=93
   set ^PH(7.7)=90
   set ^PH(8)=82
   set ^PH(8.5)=67
   set ^PH(9)=47
   set ^PH(10)=19
   set ^PH(11)=7
   set ^PH(12)=2
   set ^PH(13)=0
   
   set ^Ni(0)=98
   set ^Ni(0.25)=97
   set ^Ni(0.5)=96
   set ^Ni(0.75)=95
   set ^Ni(1)=94
   set ^Ni(1.5)=92
   set ^Ni(2)=90
   set ^Ni(3)=85
   set ^Ni(4)=70
   set ^Ni(5)=65
   set ^Ni(10)=51
   set ^Ni(15)=43
   set ^Ni(20)=37
   set ^Ni(30)=24
   set ^Ni(40)=17
   set ^Ni(50)=17
   set ^Ni(60)=5
   set ^Ni(70)=4
   set ^Ni(80)=3
   set ^Ni(90)=2
   set ^Ni(100)=1
   
    set ^FCol(1) = 99
	set ^FCol(2) = 91
	set ^FCol(3) = 86
	set ^FCol(4) = 82
	set ^FCol(5) = 80
	set ^FCol(6) = 78
	set ^FCol(7) = 76
	set ^FCol(8) = 74
	set ^FCol(9) = 73
	set ^FCol(10) = 72
	set ^FCol(20) = 63
	set ^FCol(30) = 58
	set ^FCol(40) =55
	set ^FCol(50) = 52
	set ^FCol(60) = 50
	set ^FCol(70) = 48
	set ^FCol(80) = 47
	set ^FCol(90) = 45
	set ^FCol(100) = 44
	set ^FCol(200) = 37
	set ^FCol(300) = 34
	set ^FCol(400) = 31
	set ^FCol(500) = 29
	set ^FCol(600) = 27
	set ^FCol(700) = 25
	set ^FCol(800) = 24
	set ^FCol(900) = 23
	set ^FCol(1000) = 22
	set ^FCol(2000) = 18
	set ^FCol(3000) = 16
	set ^FCol(4000) = 15            
	set ^FCol(5000) =14
	set ^FCol(6000) = 13                        
	set ^FCol(7000) = 12                        
	set ^FCol(8000) = 11                        
	set ^FCol(9000) = 11                        
	set ^FCol(10000) = 10                        
	set ^FCol(20000) = 8                        
	set ^FCol(30000) = 7                        
	set ^FCol(40000) = 6                        
	set ^FCol(50000) = 6                        
	set ^FCol(60000) = 5                        
	set ^FCol(70000) = 5                        
	set ^FCol(80000) = 5                        
	set ^FCol(90000) = 4                        
	set ^FCol(100000) = 4                        
	set ^FCol(100001) = 2
}

ClassMethod SetWeightFactors() As %Status
{
	set ^WDO = 0.3
	set ^WPh =0.2
	set ^WFCol =0.3
	set ^WNi =0.2
	/*set ^W("DO")= 0.3
	set ^W("Ph")=0.2
	set ^W("FCol")=0.3
	set ^W("Ni")=0.2*/
}

ClassMethod IndexCalc(ph As %Numeric, ni As %Numeric, do As %Numeric, fcol As %Numeric) As %Numeric
{	
	set temp = do/8.26
	
	set do = temp * 100
	
	//set do = ROUND(do,0)
	//write "Jello",Round(do,0)
	write ROUND(do,0)
	do $system.Status.DisplayError(mean)
		
	///round the values of ph to values we have in globals
	if (ph<= 7.1 || ph>=9)
	{
		set ph = ROUND(ph,0)
	}
	elseif (ph>8 && ph<9)
	{
		set ph=8.5
	}
	elseif (ph>7.1 && ph<7.4)
	{
		set ph=7.2
	}
	elseif (ph>=7.4 && ph<7.6)
	{
		set ph=7.5
	}
	elseif (ph>=7.6 && ph<7.8)
	{
		set ph=7.7
	}
	elseif (ph>=7.8 && ph<=8)
	{
		set ph=8
	}
	
	///fcol
	if (fcol >= 1 && val <10)
	{
		set fcol = ROUND(val,0)
	}
	elseif (fcol >= 10 && fcol <100)
	{
			 set fcol = fcol \ 10
			 set fcol = ROUND(fcol,0)
			 set fcol = fcol * 10
	}
	elseif (fcol >= 100 && fcol <1000)
	{
			    set fcol = fcol \ 100
			    set fcol = ROUND(fcol,0)
			    set fcol = fcol * 100
	}
	elseif (fcol >= 1000 && fcol <10000)
	{
			    set fcol = fcol \ 1000
			    set fcol = ROUND(fcol,0)
			    set fcol = fcol * 1000
	}
	elseif (fcol >= 10000 && fcol <100000)
	{
			    set fcol = fcol \ 10000
			    set fcol = ROUND(fcol,0)
			    set fcol = fcol * 10000
	}
	
	set count =4
	
	if (ph=-1)
	{
	 set count = count-1
	}
	if (fcol = -1)
	{
	 set count = count-1
	}
	if (do =-1)
	{
	set count = count-1
	}
	if (ni = -1)
	{
	set count = count-1
	}
	
	set weight = 1\count
	set wph =weight
	set wdo = weight
	set wni = weight
	set wfcol = weight
	
	if (ph=-1)
	{
	 set wph=0
	}
	if (fcol = -1)
	{
	 set wfcol =0
	}
	if (do =-1)
	{
	set wdo =0
	}
	if (ni = -1)
	{
	set wni=0
	}
	
	
	set wph = ^PH(ph) * wph
	set wdo = ^DO(do) * wdo
	set wfcol = ^FCol(fcol) * wfcol
	set wni = ^Ni(ni) * wni
	
	set index = wph+wdo+wfol+wni
	write index
	write "Bello"
	return index
	
}

}
