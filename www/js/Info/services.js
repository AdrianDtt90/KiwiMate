angular.module('info.services', [])

.factory('Infos', function($http) {
  // Might use a resource here that returns a JSON array
  var infos = [];
  var error;

  var getReady = function(callback) {
    $http({
      method: 'GET',
      cache: false,
      url: 'data/info.json'
    }).then(function successCallback(response) {
      infos = response.data.infos;

      if(typeof callback === 'function')
        callback();
    }, function errorCallback(response) {
      error = response.statusText;

      if(typeof callback === 'function')
        callback();
    });
  };

  return {
    ready: getReady,
    error: function() {
      return error;
    },
    all: function() {
      return infos;
    },
    remove: function(info) {
      infos.splice(infos.indexOf(info), 1);
    },
    get: function(infoId) {
      for (var i = 0; i < infos.length; i++) {
        if (infos[i].id === parseInt(infoId)) {
          return infos[i];
        }
      }
      return null;
    }
  };
});
