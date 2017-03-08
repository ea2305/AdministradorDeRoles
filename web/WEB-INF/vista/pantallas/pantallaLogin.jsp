<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
    <%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>

        <title>Inicio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
        <meta lang="es"/>

        <!-- Header configuration -->
        <c:import url="/WEB-INF/vista/comun/header.jsp" />
        <link rel="stylesheet" type="text/css" href="css/login.css"/>
        <!-- local Stylesheets -->
    </head>

    <body>


    <!-- Panel principale de para formulario -->
    <div class="row full-slide">

        <div class="col s12 m12 l12">


            <!-- Titulo de la página -->
            <h2 class="white-text text-shadow center" style="margin-top: 10%">
                Regístro del Viajero
            </h2>

            <div class="col s12 m6 l6 push-l3 push-m3 card white">

                <div class="card-content black-text center">

                    <div class="card-title ">
                        <h5>
                            <fmt:message key="formaLogin.titulo" />
                        </h5>
                    </div>

                    <form id="forma" action="procesarLogin.dd" method="POST">

                        <div class="input-field col s12 text-left">
                            <i class="material-icons prefix">account_circle</i>

                            <input class="validate"
                                    id="icon_prefix"
                                    type="text" 
                                    name="user" 
                                    size="50" 
                                    maxlength="100" 
                                    value="${formaLogin.user}" />

                            <label for="icon_prefix">
                                <fmt:message key="formaLogin.etiqueta.Usuario" />
                            </label>
                        </div><br/>

                        <div class="input-field col s12 text-left">
                            <i class="material-icons prefix">lock_outline</i>
                            
                            <input class="validate"
                                    id="icon_prefix"
                                    type="password" 
                                    name="password" 
                                    size="50" 
                                    maxlength="100" 
                                    value="${formaLogin.password}" />

                            <label for="icon_prefix">
                                <fmt:message key="formaLogin.etiqueta.Contrasena" />
                            </label>
                        </div>

                        <button 
                            class="btn waves-effect waves-light green" 
                            type="submit" 
                            name="submit"
                            value="Login">
                            Iniciar
                            <i class="material-icons right">done_all</i>
                        </button>
                    </form>

                </div>
            </div>

        </div>
    </div>

    </body>

    <!-- Scripts -->
    <c:import  url="/WEB-INF/vista/comun/scripts.jsp"/>

    <!-- local scripts -->
    <scripts src="login.jss"></scripts>
</html>
