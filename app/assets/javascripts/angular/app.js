var bikeblnApp = angular.module('bikeblnApp', ['ngRoute','bikeblnControllers']);
bikeblnApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/', {
        templateUrl: 'partials/landing.html'

      })
      .when('/about',{
        templateUrl: 'partials/about.html'
      })
      .when('/rooms',{
        templateUrl: 'templates/rooms.html'
      })
      .when('/rooms/:roomId', {
        templateUrl: 'templates/room.html',
        controller: 'RoomDetailCtrl'
      })
      .when('/info',{
        templateUrl: 'templates/info.html'
      })
      .when('/contact',{
        templateUrl: 'templates/contact.html'
      })
      .otherwise({
        templateUrl: 'partials/landing.html'
      });

  }]);