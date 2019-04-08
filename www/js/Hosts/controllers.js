angular.module('hosts.controllers', [])

.controller('HostsCtrl', function($scope, $state, Hosts, UserService) {
  // default value
  $scope.limit = 15;

  $scope.hosts = [];
  $scope.search = {
    inputSearch : ''
  };

  $scope.user = UserService.getUser();

  Hosts.getAllHosts({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(hosts){
    $scope.hosts = hosts;
  });

  $scope.seeMore = function(e) {

    var item = e.currentTarget;

    Hosts.seeMore({
      limit: $scope.limit, 
      hosts: $scope.hosts,
      search: $scope.search.inputSearch
    }, function(hosts){
      $scope.hosts.push.apply($scope.hosts, hosts);

      if(hosts.length < $scope.limit)
        item.remove();
    });
  };

  $scope.searchEvent = function() {
    Hosts.getAllHosts({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(hosts){
      $scope.hosts = hosts;
    });
  };
  
})


;