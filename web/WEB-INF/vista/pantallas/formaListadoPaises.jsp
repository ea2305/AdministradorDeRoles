<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>

<script src="js/formaListadoPaises.js"></script>


<br>

<div class="row custom-height">
    
    <div class="col s12 m10 l10 push-m1 push-l1">
           
        <h5 class="title">
            <fmt:message key="formaListadoPaises.titulo" />
        </h5>
        
        <div class="error">
            
            <html:errors />
            
        </div>        
        
        <table class="table responsive-table highlight">

            <thead>
                <tr>
                    <td>
                        <b>
                            <fmt:message key="formaListadoEstados.etiqueta.nombre" />
                        </b>
                    </td>
                    <td>
                        <b>
                            <fmt:message key="formaListadoEstados.etiqueta.descripcion" />
                        </b>
                    </td>
                    <td colspan="2">
                        <b>
                            <fmt:message key="formaListadoEstados.etiqueta.administracion" />
                        </b>
                    </td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="pais" items="${formaListadoPaises.paises}">
                    <tr>
                        <td width="20%">
                            <c:out value="${pais.nombre}"/>
                        </td>
                        <td width="50%">
                            <c:out value="${pais.descripcion}"/>
                        </td>
                        <td colspan="2" width="30%">
                            
                            <a href='solicitarModificarPais.do?id=<c:out value="${pais.id}"/>&nombre=<c:out value="${pais.nombre}"/>&descripcion=<c:out value="${pais.descripcion}"/>'
                                                   class="btn waves-effect blue">
                                <fmt:message key="formaListadoEstados.etiqueta.modificar" />
                            </a>
                            
                            <a href='procesarEliminarPais.do?id=<c:out value="${pais.id}"/>'
                                                   onClick="return EliminarPais('<c:out value="${pais.nombre}"/>')"
                                                   class="btn waves-effect red">
                                <fmt:message key="formaListadoPaises.etiqueta.eliminar" />
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4">
                        <b>Total:</b> ${formaListadoPaises.contador}
                    </td>
                </tr>
            </tbody>
            
        </table> 
            
        <a href="solicitarRegistroPais.do" class="btn waves-effect green">Agregar nuevo pais...</a>
        
    </div>
    
</div>
    