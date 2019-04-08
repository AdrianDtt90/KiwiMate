angular.module('places.services', [])

.factory('Places', function($http, commonServices) {
  // Might use a resource here that returns a JSON array
  var places = [];
  var error;

  var getAllPlaces = function(option, callback) {
    commonServices.consumeService('Places','getPlaces',{
      limit : option.limit,
      search : option.search
    },function(status, resultText, data){

      if(typeof callback === 'function')
        callback(data.places);
    });
  };

  var seeMore = function(option, callback) {
    commonServices.consumeService('Places','seeMore',{
      limit : option.limit,
      amount : option.places.length,
      search : option.search
    },function(status, resultText, data){
      
      if(typeof callback === 'function')
        callback(data.places);
    });
  };

  var deleteEvent = function(place_id, callback) {
    if(window.confirm("¿Desea eliminar el lugar?"))
    {
      commonServices.consumeService('Places','deleteEvent',{
        'place_id' : place_id
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
    getAllPlaces: getAllPlaces,
    seeMore : seeMore,
    deleteEvent: deleteEvent
  };
});
