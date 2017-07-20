var zoomlevel=5;
      var map, places, infoWindow;
      var markers ;
      var autocomplete;
      var countryRestrict = {'country': 'IN'};
      var pinImage;

        function initMap() {       
        
          map = new google.maps.Map(document.getElementById('map'), {
          zoom: zoomlevel,
          center: {lat: 23.5937, lng: 78.9629},
          disableDefaultUI: true,
          mapTypeControl: false,
          panControl: false,
          zoomControl: true,
          streetViewControl: false,          
        });
              
         
          
      var marker = new google.maps.Marker({
          position: {lat: 23.5937, lng: 78.9629},
          map: map,
          title: 'Select Location'
        });
marker.setAnimation(google.maps.Animation.BOUNCE);
            
        autocomplete = new google.maps.places.Autocomplete(
              document.getElementById('autocomplete'), {
              types: ['geocode'],
              componentRestrictions: countryRestrict
            });
        places = new google.maps.places.PlacesService(map);

        autocomplete.addListener('place_changed', onPlaceChanged);
      
        var input = document.getElementById('autocomplete');
          google.maps.event.addDomListener(input, 'keydown', function(event) { 
            if (event.keyCode === 13) { 
                event.preventDefault(); 
            }
          }); 
         var contentString='<a href=file:./mydata.html> OK </a><br/>';
         var infowindow = new google.maps.InfoWindow({
            content: contentString
            });



        function placeMarker(location) {
              marker.setMap(null)
              marker = new google.maps.Marker({
              position: location, 
              
             map: map
                });
marker.setAnimation(google.maps.Animation.BOUNCE);

             }

        function onPlaceChanged() {
            var place = autocomplete.getPlace();
            if (place.geometry) {
              map.panTo(place.geometry.location);
              placeMarker(place.geometry.location);
              form1.reset();
              zoomlevel=7;
              map.setZoom(zoomlevel);  
             infowindow.open(map, marker);
             console.log("Done");
             StateNameFromCoordinates(marker.getPosition().lat(),marker.getPosition().lng());
              } else {
              document.getElementById('autocomplete').placeholder = 'Search';
            }
          }


         map.addListener('click', function(e) {
                placeMarker(e.latLng);
                map.setZoom(zoomlevel+=2);
                console.log(zoomlevel);
                infowindow.open(map, marker);
                map.setCenter(marker.getPosition());
                WeatherDetail(e.latLng.lat(),e.latLng.lng());
                localStorage.setItem("latitude",e.latLng.lat());
				localStorage.setItem("longitude",e.latLng.lng());
                StateNameFromCoordinates(e.latLng.lat(),e.latLng.lng());
                
             });          
      
        
        
         var pinColor = "0000FF";
         pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
                        new google.maps.Size(21, 34),
                        new google.maps.Point(0,0),
                        new google.maps.Point(10, 34));
        
        }
        
        function WeatherDetail(latitude,longitude)
			{
					var xmlhttp = new XMLHttpRequest();
					var url ="http://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&APPID=9aad73724ff31e833b1e14dfbf5a6f9e";
					xmlhttp.open("GET", url, true);
					xmlhttp.send();
					
					xmlhttp.onreadystatechange = function()
					{
						if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
						{
							var myArr = JSON.parse(xmlhttp.responseText);
							console.log(myArr.main)
							
							
						}
					}
			}
        
        

         function displayImpurity(distName)
        {
                    var xmlhttp = new XMLHttpRequest();
					var url ="http://localhost:57772/water/api/impurity/"+distName;
					xmlhttp.open("GET", url, true);
                    xmlhttp.setRequestHeader("Access-Control-Allow-Origin","*");
                    xmlhttp.setRequestHeader("Access-Control-Allow-Credentials", "true");
                   	xmlhttp.send();
					xmlhttp.onreadystatechange = function()
					{  if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
						{   
							var myArr = JSON.parse(xmlhttp.responseText);
                            //for(var i=0;i<myArr.names.length;i++)
                            for(var i=0;i<myArr.impurityName.length;i++)
                            {   console.log(myArr.impurityName[i]+"\n");
                                //LocationFromName(myArr.names[i]);
//                                contentString ='<p>'+myArr.impurityName[i]+'</p><br/>';
//                                new google.maps.InfoWindow({
//                                    content: contentString
//                                    });
                             
                             
                            }
                               
                                //console.log(myArr.names);
                        }
					}
        }
        
        
        function drawMarker(location,str)
        {
           var marker1=new google.maps.Marker({
            position: location,
            map: map,
            icon: pinImage
        });
            str=str.substring(0, str.indexOf("+"));
            //console.log(str);
            google.maps.event.addListener(marker1, 'click',displayImpurity(str));
            //marker1.addEventListener('onclick',displayImpurity(str));
        }
       
         function LocationFromName(str)
        {
                    var xmlhttp = new XMLHttpRequest();
					var url ="https://maps.googleapis.com/maps/api/geocode/json?address="+str+"&key=AIzaSyA7wYFmWd1SDTDqq7L990Gk5oZTgoV_cBA";
					xmlhttp.open("GET", url, true);
					xmlhttp.send();
					
					xmlhttp.onreadystatechange = function()
					{
						if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
						{
							var myArr = JSON.parse(xmlhttp.responseText);
                            drawMarker(myArr.results[0].geometry.location,str);
                            //console.log(myArr.results[0].geometry.location);
						}
					}
         
        
        }
        
        function StateNameFromCoordinates(lat,lng)
        {           console.log("StateNAmeFromCoordinates "+lat+","+lng);
                    var xmlhttp = new XMLHttpRequest();
					var url="https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&key=AIzaSyA7wYFmWd1SDTDqq7L990Gk5oZTgoV_cBA";            
					xmlhttp.open("GET", url, true);
					xmlhttp.send();
					
					xmlhttp.onreadystatechange = function()
					{
						if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
						{
							var myArr = JSON.parse(xmlhttp.responseText);
                            //drawMarker(myArr.results[0].geometry.location);
                            //console.log("Huuray");
                            OpenJSON(myArr.results[0].address_components[3].long_name);
                            //console.log(myArr.results[0].address_components[3].long_name);
						}
					}
        }
        function OpenJSON(statename)
			{       
					var xmlhttp = new XMLHttpRequest();
					var url ="http://localhost:57772/water/api/districts/"+statename;
					xmlhttp.open("GET", url, true);
                    xmlhttp.setRequestHeader("Access-Control-Allow-Origin","*");
                    xmlhttp.setRequestHeader("Access-Control-Allow-Credentials", "true");
                   	xmlhttp.send();
					xmlhttp.onreadystatechange = function()
					{  if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
						{   
							var myArr = JSON.parse(xmlhttp.responseText);
                            //for(var i=0;i<myArr.names.length;i++)
                            for(var i=0;i<myArr.names.length;i++)
                            {   //console.log(myArr.names[i]);
                                LocationFromName(myArr.names[i]);
                            }
                               
                                //console.log(myArr.names);
                        }
					}
			}
        
        
    