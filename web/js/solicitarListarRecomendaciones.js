var current_name = "";

//FormaListarRecomenaciones JS
$(document).ready( function(){
    console.log("Documento cargado.");
    //Confiugracion de materialize
    //$('#textarea1').val('New Text');
    $('.textarea1').trigger('autoresize');
    //listener para click sobre card
    $('.selectable-card').click( chooseCard );
});


function EliminarRecomendacion(strRecomendacionName){
    return confirm("¿Desea eliminar el estado '" + strRecomendacionName + "'?")
}


function chooseCard( event ){
    var id = event.currentTarget.id;
    console.log( event.currentTarget.id );

    //Obtenemos datos de cada comentario
    var nombre     = $("#nombre-" + id).html(),
        estado     = $("#estado-" + id).html(),
        usuario    = $("#usuario-" + id).html(),
        fecha      = $("#fecha-" + id).html(),
        comentario = $("#comentario-" + id).html(),
        calificacion = $("#calificacion-" + id).val();

        //Insertamos los datos a cada contenedor de muestra
        $("#nombre-id").html( nombre );
        $("#estado-id").html( estado );
        $("#usuario-id").html( usuario );
        $("#fecha-id").html( fecha );
        $("#comentario-id").html( comentario );
        $("#start-rate").empty();
        for(var i = 0 ; i < calificacion ; i++){
            console.log('a-' , i)
            $("#start-rate").append( getStar() )
        }
        
        //Agregamos acciones de comentario
        console.log('add comment')
        $('#actions-list').empty();
        $('#actions-list').html( getTemplateActions( id , nombre) );
        
}

function getTemplateActions( id , nombre ){
    return "<a class='btn waves-effect waves-light blue'" + 
        "href='solicitarModificarRecomendacion.do?id=" + id + "'>" + 
        "Modificar" +
    "</a>" + 
    "<a id='listener-info' href='procesarEliminarRecomendacion.do?id=" + id + "'" +
        "onClick='return EliminarCurrent()'" + 
        "class='btn waves-effect waves-light red'>" + 
        "Eliminar" + 
    "</a>";
}

function EliminarCurrent(){
    return EliminarRecomendacion( current_name );
}

function getStar(){
    return  "<div class='start-item' style='display: inline-block;'>" + 
                "<svg style='height: 25px;' viewBox='0 0 512 512'><path d='M512 198.525l-176.89-25.704-79.11-160.291-79.108 160.291-176.892 25.704 128 124.769-30.216 176.176 158.216-83.179 158.216 83.179-30.217-176.176 128.001-124.769z'></path></svg>" + 
            "</div>";
}