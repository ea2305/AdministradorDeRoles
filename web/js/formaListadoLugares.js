$(document).ready(function(){

    console.log("Documento cargado.");

    //Colocamos un listener para eventos de tabla
    $('.row-item').click( rowClick )

    //Modales
    $('.modal').modal();

});
//Función de verificación
function EliminarLugar(strLugarName){
    return confirm("¿Desea eliminar el estado '" + strLugarName + "'?")
}

//Acciones al seleccionar una fila en la tabla
function rowClick( event ){
    console.log( event.currentTarget )
}

function HacerMap(){
	var myLatLng = {lat: 16.7656512, lng: -93.38004419999999};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: myLatLng
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Hello World!'
  });
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