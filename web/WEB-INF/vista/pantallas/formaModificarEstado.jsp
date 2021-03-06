    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
    
    <div class="container">
        <h2 class="center-align">
            Modificar Estado
        </h2>
        <div class="row">
            <div class="col l10 m8 s12 offset-l1 offset-m2">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title" style="font-weight: bold;">Introduce los datos requeridos! <h5>ID Estado: ${formaModificarEstado.id}</h5></span>
                        <html:errors />
                        <form id="forma" action="procesarModificarEstado.do" method="post">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">label</i>
                                    <input placeholder="Introduce el nombre" id="name" name="nombre" required="required" type="text" value="${formaModificarEstado.nombre}" maxlength="100" class="validate">
                                    <label for="name"><fmt:message key="formaNuevoEstado.etiqueta.nombre"/></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">label</i>
                                    <input placeholder="Introduce la descripción" id="description" name="descripcion" required="required" type="text" value="${formaModificarEstado.descripcion}" maxlength="250" class="validate">
                                    <label for="description"><fmt:message key="formaNuevoEstado.etiqueta.descripcion"/></label>
                                </div>
                            </div>
                                
                            <input value="${formaModificarEstado.id}" name="id" style="display: none"/>
                            <div class="right-align">
                                <button type="submit" class="btn waves-effect waves-light blue darken-3" name="submit">
                                    <i class="material-icons right">send</i>
                                    Modificar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>