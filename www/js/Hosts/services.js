angular.module('hosts.services', [])

.factory('Hosts', function($http, commonServices) {
  // Might use a resource here that returns a JSON array
  var hosts = [];
  var error;

  var getAllHosts = function(option, callback) {
    commonServices.consumeService('Hosts','getHosts',{
      limit : option.limit,
      search : option.search
    },function(status, resultText, data){

      if(typeof callback === 'function')
        callback(data.hosts);
    });
  };

  var seeMore = function(option, callback) {
    commonServices.consumeService('Hosts','seeMore',{
      limit : option.limit,
      amount : option.hosts.length,
      search : option.search
    },function(status, resultText, data){
      
      if(typeof callback === 'function')
        callback(data.hosts);
    });
  };

  var deleteEvent = function(host_id, callback) {
    if(window.confirm("¿Desea eliminar el hospedaje?"))
    {
      commonServices.consumeService('Hosts','deleteEvent',{
        'host_id' : host_id
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
    getAllHosts: getAllHosts,
    seeMore : seeMore,
    deleteEvent: deleteEvent
  };
});
