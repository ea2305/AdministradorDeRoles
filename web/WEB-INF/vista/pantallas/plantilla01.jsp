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
            Administrador de Roles - UPCHIAPAS
        </title>

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        <!-- Llamada a ajax -->
		<script type="text/javascript" src="js/Ajax.js"></script>

        <!-- Hojas de estilo -->
        <link rel="stylesheet" type="text/css" href="css/plantilla.css">
        <link rel="stylesheet" type="text/css" href="css/mensajes.css">

    </head>
	
    <body>
        <!-- Cambio de maquetacion tipo tabla por divs -->
        <table class="marco" cellpadding="0">
            <tr>
                <td colspan="2">

                    <c:import url="/WEB-INF/vista/comun/banner.jsp" />
                    <c:import url="/WEB-INF/vista/comun/barraMenu01.jsp" />

                </td>
            </tr>
            <tr height="490px">
                <td align="center" valign="center" width="100%">

                    <c:import url="/WEB-INF/vista/pantallas/${param.c}" />

                </td>
            </tr>
            <tr>
                <!-- Footer Importante -->
                <td colspan="2">

                    <c:import url="/WEB-INF/vista/comun/barraPie.jsp" />
                    
                </td>
            </tr>
        </table>

    </body>
</html>
