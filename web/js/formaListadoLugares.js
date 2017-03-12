var myLatLng,
    mapload = false,
    map,
    marker;
    
$(document).ready(function(){

    console.log("Documento cargado.");

    //Colocamos un listener para eventos de tabla
    $('.row-item').click( rowClick )

    //Modales
    $('.modal').modal();
    $('.titleTable').click( titleClick );

    

});
//FunciÃ³n de verificaciÃ³n
function EliminarLugar(strLugarName){
    return confirm("¿Desea eliminar el estado '" + strLugarName + "'?");
}

function titleClick( event ){
        
        var nombre = event.currentTarget.id;
    
       $.ajax({
           method:'get',
           url   :'ordernarListaPor.do',
           data  :{
               nombre: nombre 
           },
           success:function(res){
               
               console.log(res);
               $('#contentTable').empty();
               $('#contentTable').append( res );
               
           },
           error  :function (err){
               console.error(err);
           }
       })
    
}

//Acciones al seleccionar una fila en la tabla
function rowClick( event ){
    
    var id = event.currentTarget.id;
    console.log( id )
    
    var coord = $('#' + id + '-coordenadas')
                                    .text()
                                    .replace('(','')
                                    .replace(')','')
                                    .trim()
                                    .split(',');
    console.log( coord ) ;
    
    
    $('#modal-pais').html( 
            $('#' + id + '-pais').html().trim()
    );
    $('#modal-estado').html( $('#' + id + '-estado').html().trim() );
    $('#modal-nombre').html( $('#' + id + '-nombre').html().trim() );
    $('#modal-poblacion').html("Población: " +  $('#' + id + '-poblacion').html().trim() );
    $('#modal-moneda').html( "Moneda: " + $('#' + id + '-moneda').html().trim() );
    $('#modal-descripcion').html( $('#' + id + '-descripcion').html().trim() );
    
    myLatLng = {lat: parseFloat(coord[0]), lng:  parseFloat(coord[1])};
    
    if(!mapload){ 
        map = new google.maps.Map(document.getElementById('mapModal'), {
          zoom: 12,
          center: myLatLng
        });
        
        //Configuracion de estilos personalizados
        map.setOptions( { styles : custom_style } );
        
        marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: $('#' + id + '-nombre').html().trim()
        });
        mapload = true;
    }else{
        marker.setPosition(myLatLng);
        map.setCenter(myLatLng);
    }
    
    
}

function HacerMap( event ){
    console.log( event )
    
}

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