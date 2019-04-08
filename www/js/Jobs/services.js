angular.module('jobs.services', [])

.factory('Jobs', function($http, commonServices) {
  // Might use a resource here that returns a JSON array
  var jobs = [];
  var error;

  var getAllJobs = function(option, callback) {
    commonServices.consumeService('Jobs','getJobs',{
      limit : option.limit,
      search : option.search
    },function(status, resultText, data){

      if(typeof callback === 'function')
        callback(data.jobs);
    });
  };

  var seeMore = function(option, callback) {
    commonServices.consumeService('Jobs','seeMore',{
      limit : option.limit,
      amount : option.jobs.length,
      search : option.search
    },function(status, resultText, data){
      if(typeof callback === 'function')
        callback(data.jobs);
    });
  };

  var deleteJob = function(job_id, callback) {
    if(window.confirm("¿Desea eliminar el trabajo?"))
    {
      commonServices.consumeService('Jobs','deleteJob',{
        'job_id' : job_id
      },function(status, resultText, data){
        if(data.status == 'OK')
        {
          if(typeof callback === 'function')
            callback(true); 
        }
        else
        {
          if(typeof callback === 'function')
            callback(false); 
        }
      });
    }
    else
    {
      if(typeof callback === 'function')
        callback(false); 
    }

  };

  return {
    getAllJobs: getAllJobs,
    seeMore : seeMore,
    deleteJob: deleteJob
  };
});
