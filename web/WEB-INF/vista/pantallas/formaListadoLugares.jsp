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

    <h5 class="title center col s12 m12 l12">
        <fmt:message key="formaListadoLugares.titulo" />
    </h5>

    <!-- Barra de busqueda -->
    <nav class="grey darken-3 col s12 m10 l10 push-m1 push-l1">
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
    </nav>
    <!-- Tabla de contenidos -->
    <table class="responsive-table highlight col s12 m10 l10 push-m1 push-l1">
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
                    <td>
                        <c:out value="${lugar.nombre}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.descripcion}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.poblacion}"/>
                    </td>
                    <td>
                        <a href="#${lugar.id}" class="waves-effect waves-light" onclick="HacerMap();">
                            <c:out value="${lugar.coordenadas}"/>
                        </a>
                    </td>
                    <td>
                        <c:out value="${lugar.estado}"/>
                    </td>
                    <td>
                        <c:out value="${lugar.pais}"/>
                    </td>
                    <td>
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
        
            <tr>
                <td colspan="9" align="right"><b>Total:</b> ${formaListadoLugares.contador}</td>
            </tr>
        </tbody>
    </table>

    <!-- agergar nuevo lugar -->
    <div class="options col s12 m10 l10 push-l1 push-m1">
        <a href="solicitarRegistroLugar.do" class="waves-effect waves-light btn green">Agregar nuevo lugar...</a>
    </div>

    <!-- Modales :3 -->
    <c:forEach var="lugar" items="${formaListadoLugares.lugares}">
        <div id="${lugar.id}" class="modal">
            <div class="modal-content row">
                <div class="col s12 m12 l12">
                     <div class="col s11 m11 l11">
                        <h5>
                            <c:out value="${lugar.pais}"/>
                        </h5>
                        <p>
                            <c:out value="${lugar.estado}"/>
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
                        aqui van cosas magicas de elihu
                    </div>
                    <div class="col s12 m6 l6">
                        <div class="card espacioCard">
                            <h5>
                                <c:out value="${lugar.nombre}"/>
                            </h5>
                            <p>Poblacion: <c:out value="${lugar.poblacion}"/></p>
                            <p>Moneda: <c:out value="${lugar.moneda}"/></p>
                            <div class="card-action">
                                <p>Descripcion:</p>
                                <c:out value="${lugar.descripcion}"/>
                            </div>
                        </div>
                    </div>
                    <!-- Visulaización de mapa -->
                    <div class="col s12 m12 l12 center frame-map">
                        <div id="map" style="height: 500px; width:93%">
                        <script>
                          // google.maps.event.addDomListener(window, "load", function () {
                          //     var myLatLng = {lat: 16.7656512, lng: -93.38004419999999};
                          //     var map = new google.maps.Map(document.getElementById('map'), {
                          //       zoom: 18,
                          //       center: myLatLng
                          //     });

                          //     var marker = new google.maps.Marker({
                          //       position: myLatLng,
                          //       map: map,
                          //       title: 'Hello World!'
                          //     });
                          // });
                        </script>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </c:forEach>
</section>

<!-- Mover scripts a un archivo propio -->
<script src="js/jquery-3.1.1.js"></script>
<script src="materialize/js/materialize.js"></script>
<script src="js/formaListadoLugares.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbSOVcUH2d9pQw4yuwCFE3ondsvj6vJko"
type="text/javascript"></script>
