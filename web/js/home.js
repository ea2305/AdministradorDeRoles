/* global google */

var app = angular.module('homeApp', []);

app.controller('HomeController', function ($scope, $http) {
    
    $scope.states = [];
    $scope.places = [];
    
    $('.carousel').carousel();
    $('.slider').slider();
    
    $.ajax({
        type: 'GET',
        url: 'EstadoServlet.unfiltered',
        data: {
            action: "getEstados"
        },
        success: function (data) {
            
            $scope.states = data;
            
            $scope.$apply();
            
            $("select").material_select();
            
            $scope.fixSelect();
        }
    });
    
    $scope.update = function() {
        
        var state = $scope.selectedItem;
        
        $scope.fixSelect();
        
        $.ajax({
            type: 'GET',
            url: 'EstadoServlet.unfiltered',
            data: {
                action: "getLugares",
                name: state.nombre
            },
            success: function (data) {
                
                $("#slider").html("");
                $("#slider").html(data);
                
                $scope.fixSlider();
                
            }

        });
        
    };
    
    $scope.fixSelect = function () {
        
        $("select").material_select("destroy");
        $("select").material_select();
        
    };
    
    $scope.fixSlider = function () {
        
        $('.slider').slider("destroy");
        $('.slider').slider();
        
    };
    
    
    
});

//Configuracion de estilos por Sanzzy maps :)
var custom_style = [
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#444444"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "hue": "#00ff85"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#00b5ff"
            },
            {
                "visibility": "on"
            }
        ]
    }
];

function initMap() {
    
    var map = new google.maps.Map(document.getElementById('home-map'), {
        center: {lat: -34.397, lng: 150.644},
        scrollwheel: false,
        zoom: 8
    });
    
    map.setOptions( { styles : custom_style } );
    
}
