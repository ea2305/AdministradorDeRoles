$(document).ready( function(){

    //Carga de sleector de fecha con materialize
    $('.datepicker').pickadate({
        format : 'mm/dd/yyyy',
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15 // Creates a dropdown of 15 years to control year
    });

});



function select_lugar () {

        $.ajax({
            method : 'GET',
            url : 'ListarEstado.do',
            data : { nombre : $('#lugar').val() },
            success : function( res ){
                console.log( res );
                //insertamos la informacion recibida
                $('#estado').val( res );
                //Llamamos a la funcion para obtencion de imagen
                getImage();
                //Activamos campo de materialize
                $('#label-estado').addClass( 'active' );
            },
            error : function( err ){
                console.error( err );
            }
        });
  
    }

    function getImage(){

      $.ajax({
          method : 'GET',
          url : 'getImage.do',
          data : { nombre : $('#lugar').val() },
          success : function( res ){
              console.log( res );
              //Acciones con datos
              //Limpamos contendor
              $('#img').empty()
              //Agregamos los datos
              //comprovamos el estado de la imagen

            console.log(! /(src='upload\\')/g.test( "" + res) )
              if(! /(src='upload\\')/g.test( "" + res)  ){
                  
                $('#img').append( res );

              }else{
                $('#img').append( "<img src='images/no-image.svg' alt='no image'>" )
              }

              

          },
          error : function( err ){
              console.error( err );
          }
      })
    }

    function buscar_lugar () {

        $.ajax({//Llamada por ajax con jquery
            type : "GET",
            url : "BuscarLugares.do",
            data : { nombre : $( '#buscar' ).val() },
            success : function( res ){
                //console.log( res )
                //Limpiamos los elementos existentes
                $('#lugar').empty();
                //Insertamos los resultados en la busqueda
                $('#lugar').append( res );
            },
            error : function( err ){
                console.error( err );
            }
        })
/* Reemplazamos invocacion manual de ajax

        var xmlhttp=new XMLHttpRequest();
                    
        xmlhttp.onreadystatechange=function(){
          if(xmlhttp.status==404){
              document.getElementById("lugar").innerHTML="Page not found";
          }
          if (xmlhttp.readyState==4 && xmlhttp.status==200){
              document.getElementById("lugar").innerHTML=xmlhttp.responseText;
          }
        };
        xmlhttp.open("GET","BuscarLugares.do?nombre="+valor,true);
        xmlhttp.send();
*/
  
    }