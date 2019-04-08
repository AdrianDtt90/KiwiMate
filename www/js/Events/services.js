angular.module('events.services', [])

.factory('Events', function($http, commonServices) {
  // Might use a resource here that returns a JSON array
  var events = [];
  var error;

  var getAllEvents = function(option, callback) {
    commonServices.consumeService('Events','getEvents',{
      limit : option.limit,
      search : option.search
    },function(status, resultText, data){

      if(typeof callback === 'function')
        callback(data.events);
    });
  };

  var seeMore = function(option, callback) {
    commonServices.consumeService('Events','seeMore',{
      limit : option.limit,
      amount : option.events.length,
      search : option.search
    },function(status, resultText, data){
      
      if(typeof callback === 'function')
        callback(data.events);
    });
  };

  var deleteEvent = function(event_id, callback) {
    if(window.confirm("¿Desea eliminar la compra/venta?"))
    {
      commonServices.consumeService('Events','deleteEvent',{
        'event_id' : event_id
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
    getAllEvents: getAllEvents,
    seeMore : seeMore,
    deleteEvent: deleteEvent
  };
});
