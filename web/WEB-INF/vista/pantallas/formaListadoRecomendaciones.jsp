    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
    <%@ page contentType="text/html;charset=UTF-8" %>
<style>
  .HipervinculoAdmon{
    color:#000000;
	text-decoration:none;
  }
  
  .HipervinculoAdmon:hover{
    color:#006666;
	text-decoration:underline;
  }
</style>

<script src="js/solicitarListarRecomendaciones.js"></script>


<section class="row custom-height">

    <nav class="blue-grey darken-3">
        <div class="nav-wrapper">
            <form>
                <div class="input-field">
                    <input id="search" type="search" required>
                    <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                    <i class="material-icons">close</i>
                </div>
            </form>
        </div>
    </nav>

    <div class="errors">
        <html:errors />
    </div>
    <div class="card col s12 m6 l6" style="margin-top: 5vh;height: 70vh;">
        <div class="card-content">
            
            <div class="card-title">
                Recomendaciones y reseñas
            </div>
            <!-- Iteracion de elementos "cards" -->

            <div id="list-recomendations" style="background: darkslategrey;">

                <c:forEach var="recomendacion" items="${formaListadoRecomendaciones.recomendaciones}">

                    <div id="${recomendacion.id}" class="selectable-card card col s10 m10 m10 push-s1 push-m1 push-l1">
                        
                        <div class="card-content">

                            <div id="nombre-${recomendacion.id}" class="card-title">
                                ${recomendacion.nombre}
                            </div>

                            <!--lable id="estado-${recomendacion.id}">
                                Estado: ${recomendacion.estado}
                            </lable><br>
                            <lable id="usuario-${recomendacion.id}">
                                Usuario: ${recomendacion.usuario}
                            </lable--><br>
                            <lable id="fecha-${recomendacion.id}">
                                Fecha: ${recomendacion.fecha}
                            </lable><br>

                            <div class="input-field">
                                <textarea name="comentario" 
                                            id="comentario-${recomendacion.id}"
                                            cols="30" 
                                            rows="10"
                                            class="textarea1 materialize-textarea">
                                    ${recomendacion.comentario}
                                </textarea>
                                <label for="comentario">Reseña</label>

                                <div class="start-rate-real" style="display: none;">
                                    <input id="calificacion-${recomendacion.id}" class="start-element" type="number" value="${recomendacion.calificacion}">
                                </div>
                            </div>
                        </div>
                        <!--div class="card-action">
                            <a class="btn waves-effect waves-light blue" 
                                href='solicitarModificarRecomendacion.do?id=<c:out value="${recomendacion.id}"/>'>
                                <fmt:message key="formaListadoRecomendaciones.etiqueta.modificar" />
                            </a>
                            <a href='procesarEliminarRecomendacion.do?id=<c:out value="${recomendacion.id}"/>'
                                onClick="javascript: return EliminarRecomendacion('<c:out value="${recomendacion.nombre}"/>')"
                                class="btn waves-effect waves-light red">
                                <fmt:message key="formaListadoRecomendaciones.etiqueta.eliminar" />
                            </a>
                        </div-->
                    </div>

                </c:forEach>

            </div>

        </div>
    </div>

    <div class="col s12 m6 l6"  style="margin-top: 5vh;height: 70vh;">
        <div class="card col s10 m10 l10 push-s1 push-m1 push-l1">
            <div class="card-content">
                <div id="nombre-id" class="card-title">
                    Datos de reseña
                </div>

                <lable id="estado-id">
                </lable><br>
                <lable id="usuario-id">
                </lable><br>
                <lable id="fecha-id">
                </lable><br>

                <div class="input-field">
                    <textarea name="comentario" 
                                id="comentario-id"
                                cols="30" 
                                rows="10"
                                class="textarea1 materialize-textarea">
                        Seleccione una reseña para ver mas información
                    </textarea>
                    <label for="comentario">Reseña</label>

                    <div id="start-rate">
                        <input id="calificacion-id" class="start-element" type="number" value="1">
                    </div>
                </div>
            </div>
            <div id="actions-list" class="card-action">
                Acciones de reseña
            </div>
        </div>

        <a href="solicitarRegistroRecomendacion.do" 
            class="col s10 m10 l10 push-s1 push-m1 push-l1 btn waves-effect waves-light green">Agregar nueva recomendacion...</a>    
    </div>

</section>
