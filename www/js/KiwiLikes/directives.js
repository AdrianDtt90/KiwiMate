angular.module('kiwilikes', [])

.controller('kiwilikesCtrl', function ($scope, commonServices) {

  $scope.kiwiAmount = 0;
  $scope.hasUserKiwi = false;

  $scope.init = function() {
    $scope.getKiwiAmount();
  };

  $scope.$watch('entityId', function() {
      $scope.getKiwiAmount();
  });

  $scope.getKiwiAmount = function() {
    commonServices.consumeService('KiwiLikes','getKiwiAmount',{
      'entity' : $scope.entity,
      'entity_id' : $scope.entityId
    },function(status, resultText, data){

      if(data.kiwis.length > 0)
        $scope.kiwiAmount = data.kiwis[0]['amount'];
      else
        $scope.kiwiAmount = 0;

      $scope.hasUserKiwi = data.kiwis[1]['amount'] == 0 ? false : true;
    });
  };

  $scope.addRemoveKiwi = function() {
    if($scope.hasUserKiwi)
    {
      $scope.kiwiAmount = $scope.kiwiAmount - 1;
      $scope.hasUserKiwi = false;
    }
    else
    {
      $scope.kiwiAmount = $scope.kiwiAmount + 1;
      $scope.hasUserKiwi = true;
    }

    commonServices.consumeService('KiwiLikes','addRemoveKiwi',{
      'entity' : $scope.entity,
      'entity_id' : $scope.entityId,
      'owner_id': $scope.ownerId
    },function(status, resultText, data){
      
      if(data.status != 'OK')
      {
        if($scope.hasUserKiwi)
        {
          $scope.kiwiAmount = $scope.kiwiAmount - 1;
          $scope.hasUserKiwi = false;
        }
        else
        {
          $scope.kiwiAmount = $scope.kiwiAmount + 1;
          $scope.hasUserKiwi = true;
        }
      }
    });
  };

})

.directive('kiwilikes', function() {
  return {
    restrict: 'E',
    transclude: true,
    scope: {
      entity: '=',
      entityId: '=',
      ownerId: '=',
    },
    templateUrl: 'js/KiwiLikes/templates/kiwilikes.html',
    controller: 'kiwilikesCtrl'
  };
})


;