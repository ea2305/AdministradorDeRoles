<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>

        <title>Inicio</title>

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        <link rel="stylesheet" type="text/css" href="css/plantilla.css"/>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css"/>

        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    </head>
	
    <body>

        
        <c:import url="/WEB-INF/vista/comun/banner.jsp" />
        <!-- Navegacion -->
        <c:import url="/WEB-INF/vista/comun/barraMenu01.jsp" />

        <!-- Cuerpo de documento -->
        <section class="flex-center home-body">
            Hola mundo !! prro :v
        </section>        

        <!-- Footer -->
        <c:import url="/WEB-INF/vista/comun/barraPie.jsp" />
    </body>

    <script type="text/javascript" src="js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="materialize/js/materialize.js"></script>
</html>
