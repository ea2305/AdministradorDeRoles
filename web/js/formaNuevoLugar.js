
//Configuracion de estilos por Sanzzy maps :)
var custom_style = 
[
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#444444"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "hue": "#00ff85"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#00b5ff"
            },
            {
                "visibility": "on"
            }
        ]
    }
]

//Configuracion de google maps
function initMap(){

    var   geocoder,
            infowindow,
            marker;

    window.onload = function () {

    var latLng = new google.maps.LatLng(16.7408929, -93.10159049999999);

    var opciones = {
        center: latLng,
        zoom: 5,
        mapTypeControl: false
    };

    var map = new google.maps.Map( document.getElementById("mapa"), opciones);
    
    //Configuracion de estilos personalizados
    map.setOptions( { styles : custom_style } );

    geocoder = new google.maps.Geocoder();
    infowindow = new google.maps.InfoWindow();

    google.maps.event.addListener(map, 'click', function (event) {

        geocoder.geocode(
            {
                'latLng': event.latLng
            }, function (results, status) {

                if (status == google.maps.GeocoderStatus.OK) {
                    
                    if (results[0]) {
                    
                    //Asignamos coordenadas a los campos
                    $( '#coordenadas' ).val( results[0].geometry.location );
                    $( '#field1' ).addClass('active')
                    
                    var a = results[0].formatted_address.split(',');
                    
                    //Asignamos datos de estado
                    $( '#estado' ).val( a[1].trim() );
                    $( '#field2' ).addClass('active')

                    var valor = a[2];
                    
                    $.ajax({
                        method : 'GET',
                        url : 'Service.do',
                        data : { pais : valor },
                        success : function( res ){
                            var d = res.trim().replace(/\s/g, ',');
                            var d1 = d.split(',');
                            //Asignamos valores a los campos
                            $('#pais').val( d1[0] );
                            $( '#field3' ).addClass('active');
                            
                            $('#moneda').val( d1[10] );
                            $( '#field4' ).addClass('active');
                        },
                        error : function( err ){
                            console.error( err );
                        }
                    })
                    
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
    
}