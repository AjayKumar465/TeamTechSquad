<jsp:include page="header.jsp"></jsp:include>
<style type="text/css">
#latlongmap {
	height: 400px;
	border: 1px solid red;
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
					<h4 class="card-title">UV Index Calculator</h4>
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
								<option value="67">Light pale white</option>
								<option value="100">White and fair</option>
								<option value="200">Medium white to olive</option>
								<option value=300">Olive and moderate brown</option>
								<option value="400"> Brown and Dark brown</option>
								<option value="500">Black and Very dark brown to black</option>
							</select>
							<span id="spfErrMsg" style="color:red"></span>
							<select id="spf" class="selectpicker" data-size="7"
								data-style="btn btn-primary btn-round" title="Select SPF">
								<option disabled selected>Select SPF</option>
								<option value="7">SPF 8-14</option>
								<option value="15">SPF 15</option>
								<option value="30">SPF 30</option>
								<option value="50">SPF 50</option>
								<option value="75">SPF 50+</option>
							</select>
						</div>
					</div>
					<div class="form-group">
					 <span id="uvIndexErrMsg">Choose your location on below map to get UV Index </span>:
							 <span id="uvIndex">0.0</span> 
					</div>
					
					 <button class="btn btn-primary btn-round" onclick="calculateUVIndexResult()">Calculate</button>

				</div>
		
		<div id="latlongmap"></div>

<div class="col-4 m3">
<h3 class="titleh3">Map Mouse Over Location</h3>
<span id="mlat" class="coordinatetxt">0,0</span>
</div>

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
!function(e,t){function n(){
t.getElementById("navmenu").classList.toggle("list-vertical"),t.getElementsByTagName("header")[0].classList.toggle("open"),t.getElementsByTagName("body")[0].classList.toggle("open")}function s(){o.classList.contains("open")?setTimeout(n,500):n(),o.classList.toggle("open"),t.getElementsByTagName("main")[0].classList.toggle("open")}function i(){o.classList.contains("open")&&s()}var o=t.getElementById("menu"),a="onorientationchange"in e?"orientationchange":"resize";t.getElementById("toggle").addEventListener("click",function(){s()}),e.addEventListener(a,i)}(this,this.document);</script><script type="text/javascript">
function initialize() {
	
var e = new google.maps.LatLng(1.1, 1.1), t = {zoom: 4, center: e, panControl: !0, scrollwheel: !1, scaleControl: !0, overviewMapControl: !0, overviewMapControlOptions: {opened: !0}, mapTypeId: google.maps.MapTypeId.HYBRID};
map = new google.maps.Map(document.getElementById("latlongmap"), t), geocoder = new google.maps.Geocoder, marker = new google.maps.Marker({position: e, map: map,animation: google.maps.Animation.DROP}), map.streetViewControl = !1, infowindow = new google.maps.InfoWindow({content: "(1.10, 1.10)"}), google.maps.event.addListener(map, "click", function (e) {

marker.setPosition(e.latLng);
var t = e.latLng, o = "(" + t.lat().toFixed(6) + ", " + t.lng().toFixed(6) + ")";
console.log(o);	

getUvIndx(t.lat().toFixed(6),t.lng().toFixed(6));


//infowindow.setContent(o), document.getElementById("lat").value = t.lat().toFixed(6), document.getElementById("lng").value = t.lng().toFixed(6), document.getElementById("latlngspan").innerHTML = o, document.getElementById("coordinatesurl").value = "https://www.latlong.net/c/?lat=" + t.lat().toFixed(6) + "&long=" + t.lng().toFixed(6), document.getElementById("coordinateslink").innerHTML = '&lt;a href="https://www.latlong.net/c/?lat=' + t.lat().toFixed(6) + "&amp;long=" + t.lng().toFixed(6) + '" target="_blank"&gt;(' + t.lat().toFixed(6) + ", " + t.lng().toFixed(6) + ")&lt;/a&gt;", dec2dms()
}), google.maps.event.addListener(map, "mousemove", function (e) {
var t = e.latLng;
document.getElementById("mlat").innerHTML = "(" + t.lat().toFixed(6) + ", " + t.lng().toFixed(6) + ")"
})

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
function codeAddress(e) {
e.preventDefault && e.preventDefault();
var t = document.getElementById("zU2058").value;
return"" === t ? void alert("Address can not be empty!") : void geocoder.geocode({address: t}, function (e, t) {
if (t === google.maps.GeocoderStatus.OK) {
map.setCenter(e[0].geometry.location), document.getElementById("lat").value = e[0].geometry.location.lat().toFixed(6), document.getElementById("lng").value = e[0].geometry.location.lng().toFixed(6);
var o = "(" + e[0].geometry.location.lat().toFixed(6) + ", " + +e[0].geometry.location.lng().toFixed(6) + ")";
document.getElementById("latlngspan").innerHTML = o, document.getElementById("coordinatesurl").value = "https://www.latlong.net/c/?lat=" + e[0].geometry.location.lat().toFixed(6) + "&long=" + e[0].geometry.location.lng().toFixed(6), document.getElementById("coordinateslink").innerHTML = '&lt;a href="https://www.latlong.net/c/?lat=' + e[0].geometry.location.lat().toFixed(6) + "&amp;long=" + e[0].geometry.location.lng().toFixed(6) + '" target="_blank"&gt;(' + e[0].geometry.location.lat().toFixed(6) + ", " + e[0].geometry.location.lng().toFixed(6) + ")&lt;/a&gt;", marker.setPosition(e[0].geometry.location), map.setZoom(16), infowindow.setContent(o), infowindow && infowindow.close(), google.maps.event.addListener(marker, "click", function () {
infowindow.open(map, marker)
}), infowindow.open(map, marker), dec2dms()
} else
alert("Lat and long cannot be found.")
})
}
var latlongform = document.getElementById("Vr1858");
latlongform.attachEvent ? latlongform.attachEvent("submit", codeAddress) : latlongform.addEventListener("submit", codeAddress);
var map, geocoder, marker, infowindow;
function dec2dms() {
var e = document.getElementById("lat").value, t = document.getElementById("lng").value;
document.getElementById("dms-lat").innerHTML = getdms(e, !0), document.getElementById("dms-lng").innerHTML = getdms(t, !1)
}
function getdms(e, t) {
var n = 0, m = 0, l = 0, a = "X";
return a = t && 0 > e ? "S" : !t && 0 > e ? "W" : t ? "N" : "E", d = Math.abs(e), n = Math.floor(d), l = 3600 * (d - n), m = Math.floor(l / 60), l = Math.round(1e4 * (l - 60 * m)) / 1e4, n + "&deg; " + m + "' " + l + "'' " + a
}


function calculateUVIndexResult(){
	var skinType = $("#skinType").val();
	if(skinType ==null){
		$("#skinTypeErrMsg").html("Please select skintype")
		return;
	}
	$("#skinTypeErrMsg").html("")
	var spf = $("#spf").val();
	if(spf ==null){
		$("#spfErrMsg").html("Please select SPF")
		return;
	}
	
	$("#spfErrMsg").html("")
	var uvIndex =  $("#uvIndex").text()
	if(uvIndex == "0.0"){
		$("#uvIndexErrMsg").css("color","red");
		return;
	}
	
	$("#uvIndexErrMsg").css("color","black");
	uvIndex = parseFloat(uvIndex);
	
	if(uvIndex  < 0){
			demo.showNotification("top","right","success","UV Index should be greater than 0",1000);
			return;
	}
	
	var withoutSunscreen = skinType/uvIndex;
    var	withSunscreen = (skinType/uvIndex)*spf;
    demo.showUVIndexResult(Math.round(withSunscreen),Math.round(withoutSunscreen));
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initialize&amp;key=AIzaSyBhZv3NvNq7qITRJZTloOlcNkPmQGE5txU"async defer></script>
</body>
</html>