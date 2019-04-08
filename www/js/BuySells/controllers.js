angular.module('buysells.controllers', [])

.controller('BuySellsCtrl', function($scope, $state, BuySells, UserService, $rootScope) {
  // default value
  $scope.limit = 15;

  $scope.buysells = [];
  $scope.search = {
    inputSearch : ''
  };

  $scope.user = UserService.getUser();

  BuySells.getAllBuySells({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(buysells){
    $scope.buysells = buysells;
  });

  $rootScope.$on('updated-buysellslist', function(event, profileObj) {
    BuySells.getAllBuySells({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(buysells){
      $scope.buysells = buysells;
    });
  });

  $scope.seeMore = function(e) {

    var item = e.currentTarget;

    BuySells.seeMore({
      limit: $scope.limit, 
      buysells: $scope.buysells,
      search: $scope.search.inputSearch
    }, function(buysells){
      $scope.buysells.push.apply($scope.buysells, buysells);

      if(buysells.length < $scope.limit)
        item.remove();
    });
  };

  $scope.addNewBuySell = function() {
    $state.go('add-buysells');
  };

  $scope.searchEvent = function() {
    BuySells.getAllBuySells({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(buysells){
      $scope.buysells = buysells;
    });
  };

  $scope.deleteBuySell = function(e) {

    var buysell_id = e.currentTarget.parentNode.parentNode.attributes['data-id'].value;
    var item = e.currentTarget.parentNode.parentNode;

    BuySells.deleteBuySell(buysell_id,function(statusOk){
      
      if(statusOk)
        angular.element(item).remove();
    });
  };

})

.controller('SearchBuySellsCtrl', function($scope, $state, BuySells) {
  var vm = this;
  vm.inputSearch = '';

  vm.inputDateFrom = new Date(2017, 1, 1);
  vm.inputDateTo = new Date(2017, 12, 1);
})


.controller('AddBuySellsCtrl', function($scope, $state, BuySells) {
  //Insert From
  $scope.formParam = {
      section: 'BuySells',
      service: 'addBuySell',
      pageReturn : 'buysells',
      returnEvent : 'updated-buysellslist',
      action: 'create',
      fields: [
      {
        type : 'text',
        name : 'title',
        label : 'Titulo',
        required : true
      },
      {
        type : 'textarea',
        name : 'content',
        label : 'Descripción'
      },
      {
        type : 'text',
        name : 'contact',
        label : 'Contacto'
      },
      {
        type : 'text',
        name : 'price',
        label : 'Precio',
        required : true
      },
      {
        type : 'image',
        name : 'image',
        label : 'Imagen'
      }
    ]
  };
})

.filter('dateFilter', function() {
  // | filter:search.inputSearch | dateFilter:search.inputDateFrom:search.inputDateTo
  return function(items, from, to) {
        if(!items || items.length == 0)
          return [];

        var df = from;
        var dt = to;
        var result = [];        

        for (var i=0; i<items.length; i++){
            var dc = new Date(items[i].date);
            if (df < dc && dc < dt)  {
                result.push(items[i]);
            }
        }

        return result;
  };
});

;