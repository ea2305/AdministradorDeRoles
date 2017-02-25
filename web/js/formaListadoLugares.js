$(document).ready( function(){

    console.log("Documento cargado.");

    //Colocamos un listener para eventos de tabla
    $('.row-item').click( rowClick )

});


//Función de verificación
function EliminarLugar(strLugarName){
    return confirm("¿Desea eliminar el estado '" + strLugarName + "'?")
}

//Acciones al seleccionar una fila en la tabla
function rowClick( event ){
    console.log( event.currentTarget )
}