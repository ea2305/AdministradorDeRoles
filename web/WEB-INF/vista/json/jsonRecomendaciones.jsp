<%-- 
    Document   : jsonRecomendaciones
    Created on : Mar 12, 2017, 8:49:51 PM
    Author     : gerem
--%>

<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<json:object>
    <json:array name="items" items="${formaListadoRecomendaciones.recomendaciones}" var="item">
        <json:object>
            <json:property name="nombre" value="${item.nombre}"/>
            <json:property name="estado" value="${item.estado}"/>
            <json:property name="usuario" value="${item.usuario}"/>
            <json:property name="fecha" value="${item.fecha}"/>
            <json:property name="comentario" value="${item.comentario}"/>
            <json:property name="calificacion" value="${item.calificacion}"/>
        </json:object>
    </json:array>
</json:object>
