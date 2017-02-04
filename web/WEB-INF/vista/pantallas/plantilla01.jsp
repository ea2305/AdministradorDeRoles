<!-- 
    Layout principal 
    Equipo de mantenimiento de sistemas
    colaborators: 
        Arturo Cordero Muñiz
        Elihu A. Cruz Albores
        Gabriel Reyes 
        Victor Fernando Gil Calderon
    version: 0.1.1
-->
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!-- Cabecera de HTML-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!-- Inicio de HTML -->
<html>
    <head>
    
        <title>
            Administrador de Roles | UPChiapas
        </title>

        <!-- Header configuration -->
        <c:import url="/WEB-INF/vista/comun/header.jsp" />

        <!-- local Stylesheets -->

    </head>
	
    <body>

        <!-- Banner -->
        <c:import url="/WEB-INF/vista/comun/banner.jsp" />

        <!-- Navegacion -->
        <c:import url="/WEB-INF/vista/comun/barraMenu01.jsp" />

        <!-- Cuerpo de documento -->
        <c:import url="/WEB-INF/vista/pantallas/${param.c}" />    

        <!-- Footer -->
        <c:import url="/WEB-INF/vista/comun/barraPie.jsp" />
        
        <!-- Scripts -->
        <c:import  url="/WEB-INF/vista/comun/scripts.jsp"/>

        <!-- local scripts -->
        <script type="text/javascript" src="js/Ajax.js"></script>

    </body>
</html>
