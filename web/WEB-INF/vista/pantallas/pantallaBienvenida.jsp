<!-- 
    Layout principal 
    Equipo de mantenimiento de sistemas
    collaborators: 
        Arturo Cordero Muñiz
        Elihu A. Cruz Albores
        Gabriel Reyes 
        Victor Fernando Gil Calderon
    version: 0.1.1
-->
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!-- Establecemos el lenguaje en español ! -->
<%@ page contentType="text/html;charset=UTF-8" %>

<!-- Cabecera de HTML-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!-- Inicio de HTML -->
<html>
    <head>
    
        <title>
            Registro del viajero
        </title>

        <!-- Header configuration -->
        <c:import url="/WEB-INF/vista/comun/header.jsp" />

        <!-- local Stylesheets -->


        <!-- Scripts pre carga de DOM -->
        <c:import  url="/WEB-INF/vista/comun/scripts.jsp"/>


    </head>
	
    <body>

        <!-- Banner -->
        <c:import url="/WEB-INF/vista/comun/banner.jsp" />

        <!-- Navegacion -->
        <c:import url="/WEB-INF/vista/comun/barraMenu01.jsp" />

        <!-- Cuerpo de documento -->
        <section class="custom-height">
            <h3>Pantalla de Bienvenida</h3>
            <a href="solicitarListarRoles.do">Registro del viajero</a>
        </section>

        <!-- Footer -->
        <c:import url="/WEB-INF/vista/comun/barraPie.jsp" />
    
        <!-- local scripts -->
        <script type="text/javascript" src="js/Ajax.js"></script>
        <!-- Load main.js after jquery -->
        <script type="text/javascript" src="js/main.js"></script>

    </body>
</html>
