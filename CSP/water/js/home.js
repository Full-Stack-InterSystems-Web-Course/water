
      var zoomlevel=5;
      var map, places, infoWindow;
      var markers ;
      var autocomplete;
      var countryRestrict = {'country': 'IN'};

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
          title: 'Hello World!'
        });
            
        autocomplete = new google.maps.places.Autocomplete(
              document.getElementById('autocomplete'), {
              types: ['geocode'],
              componentRestrictions: countryRestrict
            });
        places = new google.maps.places.PlacesService(map);

        autocomplete.addListener('place_changed', onPlaceChanged);

      
         var contentString='<a href=./ok.html> OK </a><br/>';
         var infowindow = new google.maps.InfoWindow({
            content: contentString
            });



        function placeMarker(location) {
              marker.setMap(null)
              marker = new google.maps.Marker({
              position: location, 
             map: map
                });

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
              } else {
              document.getElementById('autocomplete').placeholder = 'Enter a city';
            }
          }


         map.addListener('click', function(e) {
                placeMarker(e.latLng);
                map.setZoom(zoomlevel+=2);
                console.log(zoomlevel);
                infowindow.open(map, marker);
                map.setCenter(marker.getPosition());
                WeatherDetail(e.latLng.lat(),e.latLng.lng());

             });          
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
							//myFunction(myArr);
							console.log(myArr.main)
							//document.getElementById("id01").innerHTML = myArr.coord;
							
						}
					}
			}
        
    
