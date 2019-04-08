angular.module('buysells.services', [])

.factory('BuySells', function($http, commonServices) {
  // Might use a resource here that returns a JSON array
  var buysells = [];
  var error;

  var getAllBuySells = function(option, callback) {
    commonServices.consumeService('BuySells','getBuySells',{
      limit : option.limit,
      search : option.search
    },function(status, resultText, data){

      if(typeof callback === 'function')
        callback(data.buysells);
    });
  };

  var seeMore = function(option, callback) {
    commonServices.consumeService('BuySells','seeMore',{
      limit : option.limit,
      amount : option.buysells.length,
      search : option.search
    },function(status, resultText, data){
      if(typeof callback === 'function')
        callback(data.buysells);
    });
  };

  var deleteBuySell = function(buysell_id, callback) {
    if(window.confirm("¿Desea eliminar la compra/venta?"))
    {
      commonServices.consumeService('BuySells','deleteBuySell',{
        'buysell_id' : buysell_id
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
    getAllBuySells: getAllBuySells,
    seeMore : seeMore,
    deleteBuySell: deleteBuySell
  };
});
