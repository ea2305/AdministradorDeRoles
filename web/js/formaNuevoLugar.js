var   geocoder,
    infowindow,
    marker;

window.onload = function () {

var latLng = new google.maps.LatLng(16.7408929, -93.10159049999999);

var opciones = {
    center: latLng,
    zoom: 5,
    mapTypeId: google.maps.MapTypeId.HYBRID
};

var map = new google.maps.Map(document.getElementById("mapa"), opciones);

geocoder = new google.maps.Geocoder();
infowindow = new google.maps.InfoWindow();

google.maps.event.addListener(map, 'click', function (event) {

    geocoder.geocode({
    'latLng': event.latLng
    }, function (results, status) {
        
    if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
        document.getElementById('coordenadas').value =  results[0].geometry.location;
        var a = results[0].formatted_address.split(',');
        document.getElementById('estado').value =  a[1].trim();

        var valor = a[2];
        var xmlhttp=new XMLHttpRequest();
        var v = valor.replace("México","Mexico");            
        xmlhttp.onreadystatechange=function(){
            if(xmlhttp.status==404){
            }
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                var d = xmlhttp.responseText.trim().replace(/\s/g, ',');
                var d1 = d.split(',');
                //alert(d1[0] + ":"  +d1[5] + ":" + d1[10]);
                document.getElementById('pais').value =  d1[0];
                document.getElementById('moneda').value = d1[10];
            }
        };
        xmlhttp.open("GET","Service.do?pais="+valor,true);
        xmlhttp.send();
        if (marker) {
            marker.setPosition(event.latLng);
        } else {
            marker = new google.maps.Marker({
            position: event.latLng,
            map: map
            })
        }
        infowindow.setContent(results[0].formatted_address + '<br/> Coordenadas: ' + results[0].geometry.location);
        infowindow.open(map, marker);
        } else {
        document.getElementById('coordenadas').value = 'No se encontraron resultados';
        }
    } else {
        document.getElementById('coordenadas').value = 'Geocodificación  ha fallado debido a: ' + status;
    }
    });
});
}