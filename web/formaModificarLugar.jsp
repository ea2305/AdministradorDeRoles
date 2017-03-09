<%-- 
    Document   : formaModificarLugar
    Created on : Mar 6, 2017, 7:14:09 PM
    Author     : gerem
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>

<!--Inicio Elementos de cabecera -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/formaNuevoLugar.js" ></script>

<!--Fin Elementos de cabecera -->

<div class="row">
    <form id="forma" action="procesarModificarLugar.do" method="post" enctype="multipart/form-data">

        <div class="col s12 m6 l6" style="margin-top: 3rem">
            <div class="card col s12 m12 l12">

                <div class="card-title">
                    <strong>
                        <fmt:message key="formaNuevoLugar.titulo" />
                    </strong>
                </div>

                <!-- Campos de formulario -->

                    <div class="error">
                        <html:errors />
                    </div>

                    <div class="input-field">
                        <input type="text" 
                           name="nombre" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.nombre}" />
                        <label for="${formaNuevoLugar.nombre}">
                            <fmt:message key="formaNuevoLugar.etiqueta.nombre" />
                        </label>   
                    </div>



                        <div class="file-field input-field">
                            <div class="btn blue">
                                <span>File</span>
                                <input type="file" name="imagen"
                                       value="${formaNuevoLugar.imagen}">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>

                        </div>

                    <div class="input-field">
                        <input type="text" 
                           name="descripcion" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.descripcion}" />
                        <label for="${formaNuevoLugar.descripcion}">
                            <fmt:message key="formaNuevoLugar.etiqueta.descripcion" />
                        </label>   
                    </div>

                    <div class="input-field">
                        <input type="text" 
                           name="coordenadas" 
                           id="coordenadas"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.coordenadas}" />
                        <label id="field1" for="${formaNuevoLugar.coordenadas}">
                            <fmt:message key="formaNuevoLugar.etiqueta.coordenadas" />
                        </label>   
                    </div>

                    <div class="input-field">
                        <input type="text"
                                id="estado"
                                name="estado"
                                size="50" 
                                maxlength="100" 
                                value="${formaNuevoLugar.estado}"/>
                        <label id="field2" for="${formaNuevoLugar.estado}">
                            <fmt:message key="formaNuevoLugar.etiqueta.estado" />
                        </label>
                    </div> 

                        <div class="input-field">
                            <input type="text"
                                    id="pais"
                                    name="pais"
                                    size="50" 
                                    maxlength="100" 
                                    value="${formaNuevoLugar.pais}"/>
                            <label id="field3" for="${formaNuevoLugar.pais}">
                                <fmt:message key="formaNuevoLugar.etiqueta.pais" />
                            </label>
                        </div>

                        <div class="input-field">

                            <input type="text"
                                id="moneda"
                                name="moneda"
                                size="50" 
                                maxlength="100" 
                                value="${formaNuevoLugar.moneda}"/>
                            <label id="field4" for="${formaNuevoLugar.moneda}">
                                <fmt:message key="formaNuevoLugar.etiqueta.moneda" />
                            </label>

                        </div>



                <div class="card-action">

                        <button     class="btn waves-effect waves-light black" 
                                    type="button"
                                    value="Reset"
                                    onclickan="location.href='solicitarRegistroLugar.do'">
                            Reiniciar
                            <i class="material-icons right">send</i>
                        </button>

                        <button     class="btn waves-effect waves-light red" 
                                    type="submit" 
                                    name="org.apache.struts.taglib.html.CANCEL" 
                                    value="cancelar" 
                                    onclick="bCancel=true;">
                            Cancelar
                            <i class="material-icons right">send</i>
                        </button>

                    </div>

            </div>
        </div>

        <div class="col s12 m6 l6 center" style="padding-top: 3rem">

            <h5>Seleccione la posición del lugar</h5><br/>

            <div id="mapa" style="height: 500px; width:500px; margin: 1rem 3rem "></div>

            <div class="input-field">
                <input  type="number" 
                        name="poblacion" 
                        min="1"
                        max="1000" 
                        value="${formaNuevoLugar.poblacion}" />
                <label for="poblacion">

                    <fmt:message key="formaNuevoLugar.etiqueta.poblacion" />

                </label>
            </div>

            <button     class="btn waves-effect waves-light green" 
                        type="submit" 
                        name="submit"
                        value="Agregar y terminar">
                Agregar y terminar
                <i class="material-icons right">send</i>
            </button>

            <button     class="btn waves-effect waves-light blue" 
                        type="submit" 
                        name="submit"
                        value="Agregar y volver"
                        onclick="forma.action='procesarRegistroLugar.do?volver=si'">
                Agregar y volver
                <i class="material-icons right">send</i>
            </button>
        </div>
    </form>
</div>    

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbSOVcUH2d9pQw4yuwCFE3ondsvj6vJko&callback=initMap"
type="text/javascript"></script>


