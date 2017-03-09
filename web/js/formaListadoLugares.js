$(document).ready(function(){

    console.log("Documento cargado.");

    //Colocamos un listener para eventos de tabla
    $('.row-item').click( rowClick )

    //Modales
    $('.modal').modal();

});
//FunciÃ³n de verificaciÃ³n
function EliminarLugar(strLugarName){
    return confirm("¿Desea eliminar el estado '" + strLugarName + "'?");
}

//Acciones al seleccionar una fila en la tabla
function rowClick( event ){
    
    var id = event.currentTarget.id;
    console.log( id )
    
    var coord = $('#' + id + '-coordenadas').html().trim();
    console.log( coord.split(',')) 
    
    
    $('#modal-pais').html( 
            $('#' + id + '-pais').html().trim()
    );
    $('#modal-estado').html( $('#' + id + '-estado').html().trim() );
    $('#modal-nombre').html( $('#' + id + '-nombre').html().trim() );
    $('#modal-poblacion').html("Población: " +  $('#' + id + '-poblacion').html().trim() );
    $('#modal-moneda').html( "Moneda: " + $('#' + id + '-moneda').html().trim() );
    $('#modal-descripcion').html( $('#' + id + '-descripcion').html().trim() );
    

}

function HacerMap( event ){
    console.log( event )
    
}

//Configuracion de google maps
// google.maps.event.addDomListener(window, "load", function () {

//   var myLatLng = {lat: 16.7423236, lng: -93.1280275};

//   var map = new google.maps.Map(document.getElementById('Hogar'), {
//     zoom: 4,
//     center: myLatLng
//   });

//   var marker = new google.maps.Marker({
//     position: myLatLng,
//     map: map,
//     title: 'Hello World!'
//   });
// }