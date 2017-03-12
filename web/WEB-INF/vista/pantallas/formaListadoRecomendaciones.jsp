   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html;charset=UTF-8" %>

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
    <div class="card col s12 m6 l6 grey lighten-3" style="margin-top: 5vh;height: 70vh;">
        <div class="card-content">
            
            <div class="card-title">
                <strong>Recomendaciones y reseñas</strong>
            </div>
            <!-- Iteracion de elementos "cards" -->

            <div id="list-recomendations" style="background: darkslategrey;">

                <c:forEach var="recomendacion" items="${formaListadoRecomendaciones.recomendaciones}">

                    <div id="${recomendacion.id}" class="selectable-card card col s10 m10 m10 push-s1 push-m1 push-l1 horizontal ">
                        
                        <div class="card-image">
                            <img src="http://lorempixel.com/100/190/nature/6">
                        </div>
                        <div class="card-stacked">
                        
                            <div class="card-content">

                                <div id="nombre-${recomendacion.id}" class="card-title strong">
                                    ${recomendacion.nombre}
                                </div>

                                <lable id="fecha-${recomendacion.id}">
                                    Fecha: ${recomendacion.fecha}
                                </lable><br>
                                <textarea name="comentario" id="comentario-${recomendacion.id}" style="display:none">${recomendacion.comentario}</textarea>
                                <div class="start-rate-real" style="display: none;">
                                    <input id="calificacion-${recomendacion.id}" class="start-element" type="number" value="${recomendacion.calificacion}">
                                </div>
                            </div>
                            
                            <div id="estado-${recomendacion.id}" style="display:none">${recomendacion.estado}</div>
                            <div id="usuario-${recomendacion.id}" style="display:none">${recomendacion.usuario}</div>
                                
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
        <h5 id="note-list" class="center" style="margin: 1em;">Seleccione un reseña</h5>
        <div id="viewer-list" class="card col s10 m10 l10 push-s1 push-m1 push-l1 hide grey lighten-4">
            <div class="card-content">

                <div id="nombre-id" class="card-title"></div>

                <lable id="estado-id"></lable><br>
                <lable id="usuario-id"></lable><br>
                <lable id="fecha-id"></lable><br>

                <div class="input-field">
                    <textarea name="comentario" 
                                id="comentario-id"
                                cols="30" 
                                rows="10"
                                class="textarea1 materialize-textarea">
                    </textarea>
                    <label for="comentario">Reseña</label>
                </div>

                <div id="start-rate"></div>

            </div>
            <div id="actions-list" class="card-action"></div>
        </div>

        <a href="solicitarRegistroRecomendacion.do" 
            class="col s10 m10 l10 push-s1 push-m1 push-l1 btn waves-effect waves-light green">Agregar nueva recomendacion...</a>    
    </div>

</section>
