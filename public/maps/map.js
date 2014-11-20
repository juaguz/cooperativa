
function DibujarMapa(places){
	
    var popup;
    var n=1;
    var options = {
        zoom: 11
        ,center: new google.maps.LatLng(-34.608056,-58.370278)
        ,mapTypeId: google.maps.MapTypeId.ROADMAP
    };
 
    var map = new google.maps.Map(document.getElementById('map'), options);
    if (places !=0){
    place = new Array();
    
    
    for(var i in places){
        
        place[i] = new google.maps.LatLng(parseFloat(places[i][0]),parseFloat(places[i][1]));
    }

    var titulos = new Array();
    for(var i in place){
        
        var marker = new google.maps.Marker({
            position: place[i]
            , map: map
            , title: i
            , note:places[i]["notas"]
        });
 
        google.maps.event.addListener(marker, 'click', function(){
            if(!popup){
                popup = new google.maps.InfoWindow();
            }
            var note = 'Wohoooo, salió el InfoWindow cuando pulsé el marcador, en el lugar: ' + this.title
                + ' y no se repiten las burbujas, ufff, ya estoy fatigado de emocionarme...';
            popup.setContent(this.note);
            popup.open(map, this);
        });
    }
  }
};
$(function(){
	 
    var places = new Array();
    
    $("#geocomplete").geocomplete({
          details: "form",
          location:"Mexico 12,Buenos Aires",
          types: ["geocode", "establishment"],
          scrollwheel:true
        });
        
        $("#marcar").click(function(){
            event.preventDefault();
            
            var direccion  = $("#geocomplete").val();
            var lat   = $("#lat").val();
            var lng   = $("#lng").val();
            var location=[lat,lng];
            places.push(location);
            DibujarMapa(places);
            $.ajax({
            	url:'/custodias/custodias/setCoordenadas',
            	type:'POST',
            	data:'lat='+lat+'&lng='+lng+"&objetivo_direccion="+direccion,
            	success:function(e){
            		$("#lista ul").append('<li>'+direccion+'</li>');
            	}
            });
        });
});