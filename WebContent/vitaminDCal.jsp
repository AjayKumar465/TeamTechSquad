<jsp:include page="header.jsp"></jsp:include>
<style type="text/css">
 
#latlongmap {
        height: 400px;
        border: 1px solid red;
      }
     
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 131px;
        margin-top:6px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      #target {
        width: 345px;
      }
</style>

<div class="content">
	<div class="container-fluid">
		<div class="row">

			<div>


<!-- 				<div class="card ">
					<div class="card-header">
						<h4 class="card-title">
							 UV Index And SPF-What You Need To Know To Be Sun Safe <small class="description">
						</small>
						</h4>
					</div>
					<div class="card-body ">
						<ul class="nav nav-pills nav-pills-warning" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#link1" role="tablist"> UV Index </a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#link2" role="tablist"> SPF </a></li>
						</ul>
						<div class="tab-content tab-space">
							<div class="tab-pane active" id="link1">
								 Is a measure of the Earth's UV radiation levels at sea level, taking into account the areas weather conditions. 
								 Measured daily on a scale from 1-10, it indicates the potential for skin damage due to over exposure.
								 <br/>
								  Find your local UV index below.
							</div>
							<div class="tab-pane" id="link2">
								Sun Protection Factor.  It is the factor by which your safe sun exposure time (no burning) can be multiplied. <br />
								<br />The maximum amount of time, that the unprotected skin should be exposed to sunlight. An already present tan increases the self-protection time. This doesn't apply to pre-tanning with a sun tanning bed, because those commonly have a different distribution of the UV-radiation (less UV-B) as the sunlight. (Advice:  Don't use of sun tanning beds for cosmetic reasons.)
							</div>
						</div>
					</div>
				</div> -->
			</div>
		</div>

		<div class="card ">
			<div class="card-header card-header-text card-header-rose">
				<div class="card-text">
					<h4 class="card-title">Vitamin D Calculator</h4>
				</div>
			</div>
			<div class="card-body ">
				<h4 class="card-title"></h4>
		<!-- 		<div id="map-canvas"></div> -->
		<div  id="Vr1858">
					<div class="row">
						<div class="col-sm-2 col-md-6 col-sm-3">
						<span id="skinTypeErrMsg" style="color:red"></span>
							<select id="skinType" class="selectpicker" data-size="7"
								data-style="btn btn-primary btn-round" title="Select Skin type">
								<option disabled selected>Select skin type</option>
								<option value="1">Light pale white</option>
								<option value="2">White and fair</option>
								<option value="3">Medium white to olive</option>
								<option value=4">Olive and moderate brown</option>
								<option value="5"> Brown and Dark brown</option>
								<option value="6">Black and Very dark brown to black</option>
							</select>
						</div>
					</div>
					<div class="form-group">
					 <span id="uvIndexErrMsg">Choose your location on below map to get UV Index </span>:
							 <span id="uvIndex">0.0</span> 
					</div>
					
					 <button class="btn btn-primary btn-round" onclick="calculateUVIndexResult()">Calculate</button>

				</div>
		<input id="pac-input"  type="text" placeholder="Search Box">
		<div id="latlongmap"></div>


							</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script type="application/ld+json">{"@context":"http://schema.org","@type":"WebSite","name":"Lat Long","alternateName":"Latitude and Longitude","url":"https://www.latlong.net/","sameAs":["https://plus.google.com/+LatlongNet","https://twitter.com/latlong_net"]}</script>
<script>var head=document.getElementsByTagName("head")[0],insertBefore=head.insertBefore;head.insertBefore=function(e,o){e.href&&0===e.href.indexOf("https://fonts.googleapis.com/css?family=Roboto")||insertBefore.call(head,e,o)};
var yid ='main';
//function gotop(){return document.body.scrollTop=document.documentElement.scrollTop=0,!1}window.onscroll=function(){var o=document.getElementsByTagName("body")[0].scrollTop;o>=100?document.getElementById("cd-top").className="cd-top cd-is-visible":document.getElementById("cd-top").className="cd-top"};
//function pscm(e){e.preventDefault&&e.preventDefault();var t=document.getElementById("commentname").value,n=document.getElementById("commenttext").value,m=new XMLHttpRequest,a="commentname="+encodeURIComponent(t)+"&yid="+encodeURIComponent(yid)+"&commenttext="+encodeURIComponent(n);return m.open("POST","/_addcomment.php",!0),m.setRequestHeader("Content-type","application/x-www-form-urlencoded"),m.onreadystatechange=function(){4===m.readyState&&200===m.status?(document.getElementById("tagmessage").innerHTML="Your comment saved successfully and will publish after approval.",document.getElementById("commentname").value="",document.getElementById("commenttext").value=""):document.getElementById("tagmessage").innerHTML="There was an error, please try again later.",document.getElementById("tagmessage").style.visibility="visible"},m.send(a),!1}var frmcomment=document.getElementById("frmcomment");frmcomment.attachEvent?frmcomment.attachEvent("submit",pscm):frmcomment.addEventListener("submit",pscm);
</script>
<script>

var skinTypes = [
					{type:1,uv_3_5:"10-15 mns",uv_6_7:"5-10 mns",uv_8_10:"2-8 mns",uv_11:"1-5 mns"},
					{type:2,uv_3_5:"15-20 mns",uv_6_7:"10-15 mns",uv_8_10:"5-10 mns",uv_11:"2-8 mns"},
					{type:3,uv_3_5:"20-30 mns",uv_6_7:"15-20 mns",uv_8_10:"10-15 mns",uv_11:"5-10 mns"},
					{type:4,uv_3_5:"30-40 mns",uv_6_7:"20-30 mns",uv_8_10:"15-20 mns",uv_11:"10-15	 mns"},
					{type:5,uv_3_5:"40-60 mns",uv_6_7:"30-40 mns",uv_8_10:"20-30 mns",uv_11:"15-20 mns"},
					{type:6,uv_3_5:"40-60 mns",uv_6_7:"30-40 mns",uv_8_10:"20-30 mns",uv_11:"15-20 mns"}
                ];


function initAutocomplete() {
	 
    var map = new google.maps.Map(document.getElementById('latlongmap'), {
      center: {lat:38.555475, lng: -95.665000},
      zoom: 3,
      mapTypeId: 'hybrid'
    });	

    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
      searchBox.setBounds(map.getBounds());
      console.log(map.center.lat().toFixed(6),map.center.lng().toFixed(6));
      getUvIndx(map.center.lat().toFixed(6),map.center.lng().toFixed(6));
      
    });

    var markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function() {
      var places = searchBox.getPlaces();

      if (places.length == 0) {
        return;
      }

      // Clear out the old markers.
      markers.forEach(function(marker) {
        marker.setMap(null);
      });
      markers = [];

      // For each place, get the icon, name and location.
      var bounds = new google.maps.LatLngBounds();
      places.forEach(function(place) {
        if (!place.geometry) {
          console.log("Returned place contains no geometry");
          return;
        }
        var icon = {
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(25, 25)
        };

        // Create a marker for each place.
        markers.push(new google.maps.Marker({
          map: map,
          icon: icon,
          title: place.name,
          position: place.geometry.location
        }));

        if (place.geometry.viewport) {
          // Only geocodes have viewport.
          bounds.union(place.geometry.viewport);
        } else {
          bounds.extend(place.geometry.location);
        }
      });
      map.fitBounds(bounds);
    });
  }



function getUvIndx(lt,lang){
$.ajax({
	  type: 'GET',
	  dataType: 'json',
	  beforeSend: function(request) {
	    request.setRequestHeader('x-access-token', '85e5ad0b014d872e5702d6b5e5c87966');
	  },
	  url: 'https://api.openuv.io/api/v1/uv?lat=' + lt + '&lng=' + lang,
	  success: function(response) {
		  document.getElementById("uvIndex").innerHTML = response.result.uv;
	    //handle successful response
	  },
	  error: function(response) {
	    // handle error response
	  }
	}); 
}

function calculateUVIndexResult(){
	var selectedSkinType = $("#skinType").val();
	if(selectedSkinType ==null){
		$("#skinTypeErrMsg").html("Please select skintype")
		return;
	}
	$("#skinTypeErrMsg").html("")
	
	var uvIndex =  $("#uvIndex").text()
	if(uvIndex == "0.0"){
		$("#uvIndexErrMsg").css("color","red");
		return;
	}
	$("#uvIndexErrMsg").css("color","black");
	
	uvIndex = parseFloat(uvIndex);
	uvIndex = Math.round(uvIndex);
	if(uvIndex<1){
		demo.showVitaminDResult("UV Index should greater than 3 to get sufficient vitaminD");
		return;
	}
	
	var skinType = skinTypes.filter(function(skin){
		return skin.type == selectedSkinType
	})[0]	;
	var sunlightExposureTime = getMinitis(uvIndex,skinType);
	
	
	
	demo.showVitaminDResult("you are exposed to "+sunlightExposureTime+" of sunlight at least 3 times per week, wearing a swimsuit or shorts and a T-shirt, and have not applied sunscreen")
	}
	
	function getMinitis(uvIndex,skinType){
		if(uvIndex>=3 && uvIndex<=5){
			return skinType.uv_3_5;
		}else if(uvIndex>=6 && uvIndex<=7){
			return skinType.uv_6_7;
		}else if(uvIndex>=8 && uvIndex<=10){
			return skinType.uv_8_10;
		}else {
			return skinType.uv_11;
		}
	}
	

</script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhZv3NvNq7qITRJZTloOlcNkPmQGE5txU&libraries=places&callback=initAutocomplete"
         async defer></script>

</body>
</html>