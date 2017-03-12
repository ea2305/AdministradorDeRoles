<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>

<!-- funciones de llamada y busqueda en archivo js independiente-->
<script src="js/formaNuevoRecomendacion.js"></script>


<div class="row custom-height" style="margin-top: 2rem">

    <div class="col s12 m12 l12">
        <html:errors />
    </div>

    <div class="card col s12 m10 l10 push-m1 push-l1">

        <div class="card-content">

            <div class="card-title">
                <fmt:message key="formaNuevoRecomendacion.titulo" />
            </div>

            <form   id="forma" 
                    action="procesarModificarRecomendacion.do" 
                    method="post"
                    class="col s12 m12 l12">

                <section class="col s12 m8 l8">
                    
                    <div class="input-field">
                        <label id="label-estado" for="estado">
                            <fmt:message key="formaNuevoRecomendacion.etiqueta.estado" />
                        </label>

                        <input type="text" 
                                id="estado"
                                name="estado" 
                                size="50" 
                                maxlength="100" 
                                value="${formaModificarRecomendacion.estado}" 
                                readonly/>
                    </div>

                    <div class="input-field">
                        <label for="date">
                            <fmt:message key="formaNuevoRecomendacion.etiqueta.fecha" />
                        </label>

                        <input type="date" 
                                class="datepicker"
                                name="fecha" 
                                value="${formaModificarRecomendacion.fecha}" 
                                min="2000-01-02"/>
                    </div>

                    <div class="input-field">
                        <td align="right">
                            <fmt:message key="formaNuevoRecomendacion.etiqueta.comentario" />
                        </td>
                        <td align="left">
                            <input type="text" 
                                name="comentario" 
                                size="50" 
                                maxlength="100" 
                                value="${formaModificarRecomendacion.comentario}" />
                        </td>
                    </div>

                    <label for="number">
                        <fmt:message key="formaNuevoRecomendacion.etiqueta.calificacion" />
                    </label>
                    <p class="range-field">
                        <input  id="tester" 
                                name="calificacion"
                                type="range" 
                                min="1"
                                max="5" />
                    </p>
                </section>
                <div class="col s12 m4 l4 center">
                    <div class="card-image">
                        <div id="img" align="center" style="width: 200px; height: 200px">
                            <img src="images/no-image.svg" alt="image">
                        </div>
                    </div>
                </div>

                <div class="card-action col s12 m12 l12">
                    <button class="btn waves-effect waves-light green" 
                            type="submit" name="submit">
                        Actualizar y terminar
                        <i class="material-icons right">place</i>
                    </button>
                    <button class="btn waves-effect waves-light red" 
                            type="submit" 
                            name="org.apache.struts.taglib.html.CANCEL"
                            onclick="bCancel=true;"/>
                        Cancelar
                        <i class="material-icons right">place</i>
                    </button>
                </div>
            </form> 
        </div>
    </div>
</div>