var myLatLng,
    mapload = false,
    map,
    marker,
    chart;
    
$(document).ready(function(){

    console.log("Documento cargado.");

    //Colocamos un listener para eventos de tabla
    $('.row-item').click( rowClick )

    //Modales
    $('.modal').modal();
    $('.titleTable').click( titleClick );

    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawMultSeries);

});
//Función de verificación
function EliminarLugar(strLugarName){
    return confirm("Desea eliminar el estado '" + strLugarName + "'?");
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
    var nombre = $('#' + id + '-nombre').text().trim();
    console.log( id );
    
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
    $('#modal-nombre').html( nombre );
    $('#modal-poblacion').html("Poblaci?: " +  $('#' + id + '-poblacion').html().trim() );
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
    
    getDataPlace( nombre );
    
}

function drawMultSeries( data ) {
    
    var data = data || [["none",'data']];
    
    var data = google.visualization.arrayToDataTable( data );

    var options = {
      title: 'Impacto de lugar',
      chartArea: {width: '100%'},
      hAxis: {
        title: 'Calificaciones totales',
        minValue: 0
      },
      vAxis: {
        title: 'Calificaci?'
      }
    };

      chart = new google.visualization.BarChart(document.getElementById('chart_div'));
      chart.draw(data, options);
}

function getDataPlace( place ){
    
    $.ajax({
        method:'post',
        url   :'recomendacionesPor.do',
        data  :{
            nombre: place 
        },
        success:function(res){
            //console.log(res);
            var data = JSON.parse( res );
            var points = data.items.map( function(e){
                return e.calificacion;
            });
            
            var counts = {};
            points.forEach(function(x) { counts[x] = (counts[x] || 0)+1; });
            var dataChart = [];
            
            //Title chart
            dataChart.push( ['Puntaje', '2010 Population'] );
            for (var property in counts) {
                if (counts.hasOwnProperty(property)) {
                    dataChart.push( [property,counts[property]] );
                }
            }
            //console.log( dataChart )
            drawMultSeries(dataChart);
            
        },
        error  :function (err){
            console.error(err);
        }
     })
    
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