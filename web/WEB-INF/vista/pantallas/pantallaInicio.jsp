<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    
<html>
    <head>
        <title>Inicio</title>
            
        <!-- Header configuration -->
        <c:import url="/WEB-INF/vista/comun/header.jsp" />
            
    </head>
    
    <body ng-app="homeApp" ng-controller="HomeController">
            
        <!-- Banner -->
        <c:import url="/WEB-INF/vista/comun/banner.jsp" />
            
        <!-- Navegacion -->
        <c:import url="/WEB-INF/vista/comun/barraMenu01.jsp" />
            
        <section class="home-body">
            <div class="row">
                <div class="col s12 m6 l6 center frame-map">
                    <div id="home-map" style="height: 500px; width: 500px"></div>
                </div>
                <div class="col s12 m6 l6" style="margin-top: 3rem">
                    <div class="input-field col s12">
                        <select ng-options="state as state.nombre for state in states" 
                                ng-model="selectedItem" ng-change="update()"></select>
                        <label>Elegir estado:</label>
                    </div>
                    <!-- Cabecera -->
                    <div class="card col s12 m12 l12">
                        <div class="card-content">
                            
                            <div class="card-title">
                                <strong>Lugares turísticos del estado de {{selectedItem.nombre}}</strong>
                            </div>
                            
                            <!-- Espacio de card-->
                            <div class="slider">
                                <ul class="slides" id="slider">
                                </ul>
                            </div>
      
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
            
        <!-- JavaScript -->
        <c:import  url="/WEB-INF/vista/comun/scripts.jsp"/>
        <script type="text/javascript" src="js/angular.min.js"></script>
        <script type="text/javascript" src="js/home.js"></script>
            
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbSOVcUH2d9pQw4yuwCFE3ondsvj6vJko&callback=initMap" type="text/javascript"></script>
        
    </body>
        
</html>