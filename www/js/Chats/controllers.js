angular.module('chats', [])

.controller('chatListCtrl', function ($scope, commonServices) {

  $scope.init = function() {
    $scope.chats = [];
    $scope.regions = [];

    $scope.getRegionsUsers();
    $scope.getChats();
  }

  $scope.getRegionsUsers = function() {
    $scope.regions = [];
    commonServices.consumeService('Regions','getRegionsUsers',{},function(status, resultText, data){
      $scope.regions = data.regions;
      $scope.cities = $scope.regions[0];
    });
  };

  $scope.getChats = function() {
    $scope.chats = [];
    commonServices.consumeService('Chats','getChats',{

    },function(status, resultText, data){
      $scope.chats = data.chats;
    });
  };

})


.controller('myChatListCtrl', function($scope, $stateParams, $ionicScrollDelegate, commonServices) {

  commonServices.consumeService('Chats','getUserChats',{
  },function(status, resultText, data){

    $scope.chatItems = data.chats;

  });

})



.controller('chatDetailCtrl', function($scope, $state, $stateParams, $ionicScrollDelegate, commonServices, $ionicLoading, $ionicScrollDelegate) {
  //$scope.chat = Chats.get($stateParams.chatId);

  $scope.chat = {};
  
  $scope.init = function() {
    commonServices.consumeService('Profile','getUserProfile',{},function(status, resultText, data){
      $scope.image = data.users[0].image;
    });

    if($stateParams.chatId)
    {
      getUserProfileById();
    }
  };

  var getUserProfileById = function() {
    commonServices.consumeService('Profile','getUserProfileById',{
      id: $stateParams.chatId
    },function(status, resultText, data){

      $scope.chat = {
        id: data.users[0].id,
        name: data.users[0].name,
        image: data.users[0].image,
        messages : []
      };

      commonServices.consumeService('Chats','getChatDetails',{
        user_id2: $stateParams.chatId
      },function(status, resultText, data){
        if(data.chats.length > 0)
        {          
          angular.forEach(data.chats, function(value, key) {
            $scope.chat.messages.push({
              type: value.type,
              text: value.text,
              image: value.image,
              time: value.time
            });
          });
        }

        if($state.current.name == 'chat-detail')
        {
          $ionicScrollDelegate.scrollBottom();

          setTimeout(function(){
            getUserProfileById();
          }, 15000);
        }
      });
    });
  };

  $scope.sendMessage = function() {

    commonServices.consumeService('Chats','updateChat',{
      user_id2 : $stateParams.chatId,
      content : $scope.input.message
    },function(status, resultText, data){

      if(data.status == 'OK')
      {
        var message = {
          type: 'sent',
          time: 'Recien',
          text: $scope.input.message
        };

        $scope.input.message = '';

        // push to messages list
        $scope.chat.messages.push(message);

        $ionicScrollDelegate.$getByHandle('mainScroll').scrollBottom();
      }
      else
      {
        $ionicLoading.show({
          template: 'Ocurrió un error, intentá nuevamente...',
          duration: 3000
        });
      }

      $ionicLoading.hide();
    });
  };

})


;