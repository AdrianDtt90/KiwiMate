angular.module('dictionary.controllers', [])

.controller('DictionaryCtrl', function($scope, $state, Dictionary) {
  // default value
  Dictionary.ready(function(){
  	$scope.sentences = Dictionary.all();
  });
})


;