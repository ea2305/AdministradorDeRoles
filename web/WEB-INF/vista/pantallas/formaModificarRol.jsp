<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>

<div class="error">
    <html:errors />
</div>

<div class="custom-height" style="margin-top: 3rem">

    <form class="row" id="forma" action="procesarModificarRol.do" method="post">

        <div class="card col s12 m10 l10 push-m1 push-l1">

            <div class="card-title">
                <h5 class="title center">
                    Modificar Rol
                </h5>
            </div>

            <div class="card-content">

                <input name="id" value="${formaModificarRol.id}" style="display:none"/>
                
                <div class="input-field">
                    <input type="text" 
                            class="validate"
                            type="text" 
                             name="nombre" 
                             size="50" 
                             maxlength="100" 
                             value="${formaModificarRol.nombre}" />
                    <label for="<fmt:message key="formaNuevoRol.etiqueta.nombre" />">
                        <fmt:message key="formaNuevoPais.etiqueta.nombre" />
                    </label>
                </div>


                <div class="input-field">

                    <input  class="validate"
                            type="text" 
                            name="descripcion" 
                            size="50" 
                            maxlength="100" 
                            value="${formaModificarRol.descripcion}"/>

                    <label for="<fmt:message key="formaNuevoRol.etiqueta.descripcion" />">
                        <fmt:message key="formaNuevoRol.etiqueta.descripcion" />
                    </label>
                </div>

            </div>

            <div class="card-action">

                <button     class="btn waves-effect waves-light green" 
                            type="submit" 
                            name="submit"
                            value="Agregar y terminar">
                    Actualizar y terminar
                    <i class="material-icons right">send</i>
                </button>


                <button     class="btn waves-effect waves-light red" 
                            type="submit" 
                            name="org.apache.struts.taglib.html.CANCEL"
                            value="cancelar"
                            onclick="bCancel=true;">
                    Cancelar
                    <i class="material-icons right">error</i>
                </button>
            </div>

        </div>

    </form>


</div>