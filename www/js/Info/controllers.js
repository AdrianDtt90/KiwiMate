angular.module('info.controllers', [])

.controller('InfoCtrl', function($scope, $state, Infos) {
  // default value
  Infos.ready(function(){
  	$scope.infoItems = Infos.all();
  });
})

.controller('InfoDetailCtrl', function($scope, $stateParams, Infos) {
  $scope.info = Infos.get($stateParams.infoId);
})

;