<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>

<script language="javascript" type="text/javascript">

    function confirmDelete(strEstadoName){
        return confirm("¿Desea eliminar el estado '" + strEstadoName + "'?");
    }

</script>

<div class="container">
    
    <div class="row">
        <h2 class="center-align">
            <fmt:message key="formaListadoEstados.titulo" />
        </h2>
        <a href="solicitarRegistroEstado.do" class="btn waves-effect waves-light blue darken-3">Agregar nuevo estado...</a>
    </div>
    <div class="row">

        <table class="highlight striped responsive-table">
            <thead>
                <tr>
                    <th data-field="id"><fmt:message key="formaListadoEstados.etiqueta.nombre" /></th>
                    <th data-field="name"><fmt:message key="formaListadoEstados.etiqueta.descripcion" /></th>
                    <th data-field="price"><fmt:message key="formaListadoEstados.etiqueta.administracion" /></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="estado" items="${formaListadoEstados.estados}">
                    <tr>
                        <td><c:out value="${estado.nombre}"/></td>
                        <td><c:out value="${estado.descripcion}"/></td>
                        <td>
                            <a href='solicitarModificarEstado.do?id=<c:out value="${estado.id}"/>&nombre=<c:out value="${estado.nombre}"/>&descripcion=<c:out value="${estado.descripcion}"/>' class="btn waves-effect waves-light green darken-3">
                                <fmt:message key="formaListadoEstados.etiqueta.modificar" />
                            </a>
                        </td>
                        <td>
                            <a href='procesarEliminarEstado.do?id=<c:out value="${estado.id}"/>' onclick="return confirmDelete('<c:out value="${estado.nombre}"/>')" class="btn waves-effect waves-light red darken-3">
                                <fmt:message key="formaListadoEstados.etiqueta.eliminar" />
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" align="right" style="padding-top:25px;"><b>Total:</b> ${formaListadoEstados.contador}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>