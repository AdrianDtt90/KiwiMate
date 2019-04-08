angular.module('dictionary.services', [])

.factory('Dictionary', function($http) {
  // Might use a resource here that returns a JSON array
  var sentences = [];
  var error;

  var getReady = function(callback) {
    $http({
      method: 'GET',
      cache: false,
      url: 'data/dictionary.json'
    }).then(function successCallback(response) {
      sentences = response.data.sentences;

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
      return sentences;
    },
    remove: function(word) {
      sentences.splice(sentences.indexOf(word), 1);
    },
    get: function(sentenceId) {
      for (var i = 0; i < sentences.length; i++) {
        if (sentences[i].id === parseInt(sentenceId)) {
          return sentences[i];
        }
      }
      return null;
    }
  };
});
