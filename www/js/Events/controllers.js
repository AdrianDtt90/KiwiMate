angular.module('events.controllers', [])

.controller('EventsCtrl', function($scope, $state, Events, UserService, $rootScope) {
  // default value
  $scope.limit = 15;

  $scope.events = [];
  $scope.search = {
    inputSearch : ''
  };

  $scope.user = UserService.getUser();

  Events.getAllEvents({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(events){
    $scope.events = events;
  });

  $rootScope.$on('updated-eventslist', function(event, profileObj) {
    Events.getAllEvents({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(events){
      $scope.events = events;
    });
  });

  $scope.seeMore = function(e) {

    var item = e.currentTarget;

    Events.seeMore({
      limit: $scope.limit, 
      events: $scope.events,
      search: $scope.search.inputSearch
    }, function(events){
      $scope.events.push.apply($scope.events, events);

      if(events.length < $scope.limit)
        item.remove();
    });
  };

  $scope.addNewEvent = function() {
    $state.go('add-events');
  };

  $scope.searchEvent = function() {
    Events.getAllEvents({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(events){
      $scope.events = events;
    });
  };

  $scope.deleteEvent = function(e) {

    var event_id = e.currentTarget.parentNode.attributes['data-id'].value;
    var item = e.currentTarget.parentNode;

    Events.deleteEvent(event_id,function(statusOk){
      
      if(statusOk)
        angular.element(item).remove();
    });
  };

})

.controller('SearchEventsCtrl', function($scope, $state, Events) {
	var vm = this;
	vm.inputSearch = '';

	vm.inputDateFrom = new Date(2017, 1, 1);
	vm.inputDateTo = new Date(2017, 12, 1);
})


.controller('AddEventsCtrl', function($scope, $state, Events) {
  //Insert From
  $scope.formParam = {
      section: 'Events',
      service: 'addEvent',
      pageReturn : 'events',
      returnEvent : 'updated-eventslist',
      action: 'create',
      fields: [
      {
        type : 'text',
        name : 'title',
        label : 'Titulo',
        required : true
      },
      {
        type : 'date',
        name : 'date',
        label : 'Fecha',
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
        name : 'adress',
        label : 'Dirección',
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