angular.module('jobs.controllers', [])

.controller('JobsCtrl', function($scope, $state, Jobs, UserService, $rootScope) {
  // default value
  $scope.limit = 15;

  $scope.jobs = [];
  $scope.search = {
    inputSearch : ''
  };

  $scope.user = UserService.getUser();

  Jobs.getAllJobs({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(jobs){
    $scope.jobs = jobs;
  });

  $rootScope.$on('updated-jobslist', function(event, profileObj) {
    Jobs.getAllJobs({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    }, function(jobs){
      $scope.jobs = jobs;
    });
  });

  $scope.seeMore = function(e) {

    var item = e.currentTarget;

    Jobs.seeMore({
      limit: $scope.limit, 
      jobs: $scope.jobs,
      search: $scope.search.inputSearch
    }, function(jobs){
      $scope.jobs.push.apply($scope.jobs, jobs);

      if(jobs.length < $scope.limit)
        item.remove();
    });
  };

  $scope.addNewJob = function() {
    $state.go('add-jobs');
  };

  $scope.searchEvent = function() {
    Jobs.getAllJobs({
      limit: $scope.limit,
      search: $scope.search.inputSearch
    },function(jobs){
      $scope.jobs = jobs;
    });
  };

  $scope.deleteJob = function(e) {

    var job_id = e.currentTarget.parentNode.attributes['data-id'].value;
    var item = e.currentTarget.parentNode;

    Jobs.deleteJob(job_id,function(statusOk){
      
      if(statusOk)
        angular.element(item).remove();
    });
  };

})

.controller('SearchJobsCtrl', function($scope, $state, Jobs) {
	var vm = this;
	vm.inputSearch = '';

	vm.inputDateFrom = new Date(2017, 1, 1);
	vm.inputDateTo = new Date(2017, 12, 1);
})


.controller('AddJobsCtrl', function($scope, $state, Jobs) {
  //Insert From
  $scope.formParam = {
      section: 'Jobs',
      service: 'addJob',
      action: 'create',
      pageReturn : 'jobs',
      returnEvent : 'updated-jobslist',
      fields: [
      {
        type : 'text',
        name : 'title',
        label : 'Titulo',
        required : true
      },
      {
        type : 'text',
        name : 'type',
        label : 'Cargo',
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