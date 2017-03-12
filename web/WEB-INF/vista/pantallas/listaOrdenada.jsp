<%-- 
    Document   : listaOrdenada
    Created on : Mar 12, 2017, 1:44:40 PM
    Author     : gerem
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>

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