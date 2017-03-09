    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>

<style>
    .modal { width: 90% !important ; height: 100% !important ; }
    .color-icon { color: black; }
    .espacioCard { padding: 1em; }
</style>

<section class="custom-height row">
    
    <div class="errors col s12 m12 l12">
        <html:errors />
    </div>

    <!-- Barra de busqueda -->
    <!--nav class="grey darken-3 col s12 m10 l10 push-m1 push-l1">
        <div class="nav-wrapper">
            <form>
                <div class="input-field transparent">
                    <input id="search" type="search" required>
                    <label class="label-icon" for="search">
                        <i class="material-icons">search</i>
                    </label>
                    <i class="material-icons">close</i>
                </div>
            </form>
        </div>
    </nav-->
    <!-- Tabla de contenidos -->
    
    <div class="col s12 m10 l10 push-m1 push-l1">
        
        <h5 class="title col s12 m12 l12">
            <fmt:message key="formaListadoLugares.titulo" />
        </h5>
        
        <table class="responsive-table highlight">
            <thead>
                <tr>
                    <th data-field="nombre">
                        <fmt:message key="formaListadoLugares.etiqueta.nombre" />
                    </th>
                    <th data-field="descripcion">
                        <fmt:message key="formaListadoLugares.etiqueta.descripcion" />
                    </th>
                    <th data-field="poblacion">
                        <fmt:message key="formaListadoLugares.etiqueta.poblacion" />
                    </th>
                    <th data-field="coordenadas">
                        <fmt:message key="formaListadoLugares.etiqueta.coordenadas" />
                    </th>
                    <th data-field="estado">
                        <fmt:message key="formaListadoLugares.etiqueta.estado" />
                    </th>
                    <th data-field="pais">
                        <fmt:message key="formaListadoLugares.etiqueta.pais" />
                    </th>
                    <th data-field="moneda">
                        <fmt:message key="formaListadoLugares.etiqueta.moneda" />
                    </th>
                </tr>
            </thead>

        <tbody>
            <c:forEach var="lugar" items="${formaListadoLugares.lugares}">
                <tr id="${lugar.id}" class="row-item">
                    <td id="${lugar.id}-nombre">
                        <c:out value="${lugar.nombre}"/>
                    </td>
                    <td id="${lugar.id}-descripcion">
                        <c:out value="${lugar.descripcion}"/>
                    </td>
                    <td id="${lugar.id}-poblacion">
                        <c:out value="${lugar.poblacion}"/>
                    </td>
                    <td>
                        <a id="${lugar.id}-coordenadas" href="#modalInfo" class="waves-effect waves-light">
                            <c:out value="${lugar.coordenadas}"/>
                        </a>
                    </td>
                    <td id="${lugar.id}-estado">
                        <c:out value="${lugar.estado}"/>
                    </td>
                    <td id="${lugar.id}-pais">
                        <c:out value="${lugar.pais}"/>
                    </td>
                    <td id="${lugar.id}-moneda">
                        <c:out value="${lugar.moneda}"/>
                    </td>
                    <td>
                        <a href='solicitarModificarLugar.do?id=<c:out value="${lugar.id}"/>&descripcion=<c:out value="${lugar.descripcion}"/>&nombre=<c:out value="${lugar.nombre}"/>&poblacion=<c:out value="${lugar.poblacion}"/>&coordenadas=<c:out value="${lugar.coordenadas}"/>&estado=<c:out value="${lugar.estado}"/>&pais=<c:out value="${lugar.pais}"/>&moneda=<c:out value="${lugar.moneda}"/>' 
                            class="waves-effect waves-light btn blue">
                            
                            <i class="material-icons left">mode_edit</i>
                            
                            <!--fmt:message key="formaListadoLugares.etiqueta.modificar" /-->
                        </a>
                    </td>
                    <td>
                        <a href='procesarEliminarLugar.do?id=<c:out value="${lugar.id}"/>'
                        onClick="javascript: return EliminarLugar('<c:out value="${lugar.nombre}"/>')"
                        class="waves-effect waves-light btn red">
                            <i class="material-icons left">delete</i>
                            <!--fmt:message key="formaListadoLugares.etiqueta.eliminar" /-->
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>    
    

    <!-- agergar nuevo lugar -->
    <div class="options col s12 m10 l10 push-l1 push-m1">
        <a href="solicitarRegistroLugar.do" class="waves-effect waves-light btn green">Agregar nuevo lugar...</a>
    </div>

    <div id="modalInfo" class="modal">
        <div class="modal-content row">
            <div class="col s12 m12 l12">
                 <div class="col s11 m11 l11">
                    <h5 id="modal-pais">
                        Pais
                    </h5>
                     <p id="modal-estado">
                        Estado
                    </p> 
                </div>
                <div class="col s1 m1 l1">
                    <a href="#!" class=" modal-action modal-close waves-effect waves-green">
                        <i class="medium material-icons color-icon">cancel</i>
                    </a>
                </div>
            </div>

            <hr>

            <div class="col s12 m12 l12">
                <div class="col s12 m6 l6">
                    <h5>Satisfaccion</h5>
                    
                    <!--
                    Mapas
                    -->
                    
                </div>
                <div class="col s12 m6 l6">
                    <div class="card espacioCard">
                        <h5 id="modal-nombre">
                            Nombre
                        </h5>
                        <p id="modal-poblacion">
                            Poblacion:
                        </p>
                        <p id="modal-moneda">
                            Moneda: 
                        </p>
                        <div class="card-action">
                            <p id="modal-descripcion">
                                Descripcion:
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Visulaización de mapa -->
                <div class="col s12 m12 l12 center frame-map">

                    <div id="map" style="height: 500px; width:93%"></div>

                </div>
            </div>
        </div>
    </div>
    
    
</section>

<!-- Mover scripts a un archivo propio -->
<script src="js/jquery-3.1.1.js"></script>
<script src="materialize/js/materialize.js"></script>
<script src="js/formaListadoLugares.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbSOVcUH2d9pQw4yuwCFE3ondsvj6vJko"></script>
