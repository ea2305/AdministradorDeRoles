    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
    
    <div class="container">
        <h2 class="center-align">
            <fmt:message key="formaNuevoEstado.titulo" />
        </h2>
        <div class="row">
            <div class="col l10 m8 s12 offset-l1 offset-m2">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title" style="font-weight: bold;">Introduce los datos requeridos!</span>
                        <html:errors />
                        <form id="forma" action="procesarRegistroEstado.do" method="post">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">perm_identity</i>
                                    <input placeholder="Introduce el nombre" id="name" name="nombre" required="required" type="text" value="${formaNuevoEstado.nombre}" maxlength="100" class="validate">
                                    <label for="name"><fmt:message key="formaNuevoEstado.etiqueta.nombre"/></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">perm_identity</i>
                                    <input placeholder="Introduce la descripción" id="description" name="descripcion" required="required" type="text" value="${formaNuevoEstado.descripcion}" maxlength="250" class="validate">
                                    <label for="description"><fmt:message key="formaNuevoEstado.etiqueta.descripcion"/></label>
                                </div>
                            </div>
                            <div class="right-align">
                                <button type="submit" class="btn waves-effect waves-light blue darken-3" name="submit">
                                    <i class="material-icons right">send</i>
                                    Agregar y terminar
                                </button>
                                
                                <button type="submit" class="btn waves-effect waves-light green darken-3" name="submit" onclick="forma.action='procesarRegistroEstado.do?volver=si'">
                                    <i class="material-icons right">send</i>
                                    Agregar y volver
                                </button>
                                
                                <button type="button" class="btn waves-effect waves-light grey darken-3" onclick="location.href='solicitarRegistroEstado.do'" >
                                    <i class="material-icons right">send</i>
                                    Reset
                                </button>
                                
                                <button type="submit" class="btn waves-effect waves-light red darken-3" name="org.apache.struts.taglib.html.CANCEL" onclick="bCancel=true;">
                                    <i class="material-icons right">send</i>
                                    Cancelar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>