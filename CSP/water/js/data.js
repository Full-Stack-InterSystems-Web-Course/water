	  var zoomlevel=5;
      var map, places, infoWindow;
      var markers ;
      var autocomplete;
      var countryRestrict = {'country': 'IN'};
      var latitude=localStorage.getItem("latitude");
      var longitude=localStorage.getItem("longitude");
        function initMap() {       
        
          map = new google.maps.Map(document.getElementById('map'), {
          zoom: zoomlevel,
          center: {lat: 23.5937, lng: 78.9629},
          disableDefaultUI: true,
          mapTypeControl: false,
          panControl: false,
          zoomControl: false,
          streetViewControl: false,          
        });
              
         
          
      var marker = new google.maps.Marker({
          position: {lat: localStorage.getItem("latitude"), lng: localStorage.getItem("longitude")},
		  animation: google.maps.Animation.BOUNCE,
          map: map,
          title: 'Select Location'
        });
            
        autocomplete = new google.maps.places.Autocomplete(
              document.getElementById('autocomplete'), {
              types: ['geocode'],
              componentRestrictions: countryRestrict
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
              } 
          }         
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
document.getElementById("lat").innerHTML=myArr.main.temp;
							console.log(myArr.main)
						}
					}
			}
        
    
