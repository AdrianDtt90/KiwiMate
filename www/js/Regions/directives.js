angular.module('regions', [])

.controller('regionsCtrl', function ($scope, commonServices) {
  $scope.regions = [];
  $scope.regionChange = false;

  $scope.init = function() {
    $scope.getRegions();
  }

  $scope.getRegions = function() {
    $scope.regions = [];
    commonServices.consumeService('Regions','getRegions',{},function(status, resultText, data){
      $scope.regions = data.regions;
    });
  };

  $scope.changeRegion = function() {

    commonServices.consumeService('Regions','changeRegion',{
      'city_id' : $scope.regionCombo
    },function(status, resultText, data){
      $scope.regionChange = true;
      
      if(data.status != 'OK')
        $scope.regionChange = false;
    });
  };

})

.directive('regions', function() {
  return {
    restrict: 'E',
    transclude: true,
    scope: {},
    templateUrl: 'js/Regions/templates/comboRegions.html',
    controller: 'regionsCtrl'
  };
})


;