/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    console.log( "Pagina cargada" );
});


function EliminarPais(strPaisName){
  return confirm("¿Desea eliminar el estado '" + strPaisName + "'?")
}