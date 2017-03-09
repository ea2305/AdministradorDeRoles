    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>


    <div class="row custom-height">
        
        <div class="error">
            <html:errors />
        </div>
        
        <div class="col s12 m10 l10 push-l1 push-m1" style="margin-top: 3rem">
            
            <h5 class="title">
                <fmt:message key="formaListadoRoles.titulo" />
            </h5>
            
            <table class="table responsive-table highlight">
                <thead>
                    
                    <tr>
                        <td>
                            <b>
                                <fmt:message key="formaListadoRoles.etiqueta.nombre" />
                            </b>
                        </td>
                        <td>
                            <b>
                                <fmt:message key="formaListadoRoles.etiqueta.descripcion" />
                            </b>
                        </td>
                        <td colspan="2">
                            <b>
                                <fmt:message key="formaListadoRoles.etiqueta.administracion" />
                            </b>
                        </td>
                    </tr>
                
                </thead>
                
                <tbody>
                    
                    <c:forEach var="rol" items="${formaListadoRoles.roles}">
                        <tr>
                            <td width="20%">
                                <c:out value="${rol.nombre}"/>
                            </td>
                            
                            <td width="50%">
                                <c:out value="${rol.descripcion}"/>
                            </td>
                            
                            <td width="30">
                                
                                <a href='solicitarModificarRol.do?id=<c:out value="${rol.id}"/>&nombre=<c:out value="${rol.nombre}"/>&descripcion=<c:out value="${rol.descripcion}"/>'
                                                       class="btn blue waves-effect">
                                    <fmt:message key="formaListadoRoles.etiqueta.modificar" />
                                </a>
                                
                                <a  href='procesarEliminarRol.do?id=<c:out value="${rol.id}"/>'
                                        onClick="return EliminarRol('<c:out value="${rol.nombre}"/>')"
                                        class="btn waves-effect red">
                                    <fmt:message key="formaListadoRoles.etiqueta.eliminar" />
                                </a>
                                
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4" align="right">
                            <b>Total:</b> ${formaListadoRoles.contador}
                        </td>
                    </tr>
                    
                </tbody>
                
            </table>
            
            <!-- Acciones de servidor -->
            <a href="solicitarRegistroRol.do" class="btn waves-effect green">Agregar nuevo rol...</a>
            
        </div>
        
    </div>
    <table cellpadding="0" cellspacing="0" width="60%" border="0">

        
    </table>

    <script language="javascript" type="text/javascript">
    <!--
      function EliminarRol(strRolName){
        return confirm("¿Desea eliminar el rol '" + strRolName + "'?")
      }
    -->
    </script>