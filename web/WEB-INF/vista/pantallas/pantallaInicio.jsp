<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>

        <title>Inicio</title>

        <!-- Header configuration -->
        <c:import url="/WEB-INF/vista/comun/header.jsp" />

        <!-- local Stylesheets -->
        <script src="js/home.js"></script>
    </head>

    <body>

        <!-- Banner -->
        <c:import url="/WEB-INF/vista/comun/banner.jsp" />

        <!-- Navegacion -->
        <c:import url="/WEB-INF/vista/comun/barraMenu01.jsp" />

        <!-- Cuerpo de documento -->
        <section class="home-body">
            
            <div class="row">
                <!-- Visulaización de mapa -->
                <div class="col s12 m6 l6 center frame-map">
                
                    <div id="home-map" style="height: 500px; width: 500px"></div>
                
                </div>
                <!-- Infomación de lugar reciente -->
                <div class="col s12 m6 l6" style="margin-top: 3rem">
                    
                    <!-- Cabecera -->
                    <div class="card col s12 m12 l12">
                        <div class="card-content">
                            
                            <div class="card-title">
                                <strong>Nombre de lugar</strong>
                            </div>
                            
                            <!-- Espacio de card-->
                            <div style="height: 3rem"></div>
                            
                            <div class="card-action">
                                <a class="btn waves-effect waves-light green" href="#id" value="id">
                                    Ver más
                                </a>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="card col s12 m12 l12">
                        <div class="card-content">
                            
                            <h5> Datos de lugar </h5>
                            <!-- Espacio de card-->
                            <div style="height: 3rem"></div>
                            <p>Estado</p>   
                            <p>Reseña</p>   
                            <div class="card-action">
                                <p>Puntos: *****</p>   
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </section>        

        <!-- Footer -->
        <c:import url="/WEB-INF/vista/comun/barraPie.jsp" />
    </body>

    <!-- Scripts -->
    <c:import  url="/WEB-INF/vista/comun/scripts.jsp"/>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbSOVcUH2d9pQw4yuwCFE3ondsvj6vJko&callback=initMap" type="text/javascript"></script>
    <!-- local scripts -->
</html>
