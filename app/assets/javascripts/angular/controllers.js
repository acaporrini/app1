var bikeblnControllers = angular.module('bikeblnControllers', []);

// mybnbControllers.controller('ContentsCtrl',['$scope','$http', function ($scope,$http) {
//   $scope.contents = {};
//   $http.defaults.headers.common['Accept'] = 'application/json';
//   $http.defaults.headers.common['Content-Type'] = 'application/json';
//   $http.get('static_pages/contents').success(function(data){
//     $scope.contents = data
//   });
//   $http.get('/rooms').success(function(data){
//     $scope.rooms = data
//   });

// }]);

// mybnbControllers.controller('RoomDetailCtrl', ['$scope','Restangular','$routeParams', function ($scope,Restangular, $routeParams) {
//     var id = $routeParams.roomId;
//     var room = Restangular.one('rooms', id);
//     var calData = {"events":[], "color": 'red', "textColor":'black'};
//     $scope.eventSources = calData;


//     room.get().then(function(room){
//       $scope.room = room
//       $scope.mainImageUrl = room.images[0].url;

//     });

//     $scope.setImage = function(imageUrl) {
//       $scope.mainImageUrl = imageUrl;
//     };



// }]);
