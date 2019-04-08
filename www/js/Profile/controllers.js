angular.module('profile.controllers', [])

.controller('ProfileCtrl', function($scope, $state, Profile, commonServices) {
  $scope.aboutChange = false;
  $scope.contactChange = false;

  $scope.limit = 15;

  $scope.init = function() {
    $scope.profile = Profile.getLoggedProfile();
    $scope.getUserProfile();
    $scope.getMyFollowers();
    $scope.getMyPosts();
  }

  $scope.fAboutChange = function(){
  	$scope.aboutChange = true;
  }

  $scope.fContactChange = function(){
  	$scope.contactChange = true;
  }

  $scope.getUserProfile = function() {
    commonServices.consumeService('Profile','getUserProfile',{},function(status, resultText, data){
      var about = data.users[0].about;
      var contact = data.users[0].contact;
      var amount_kiwis = data.users[0].amount_kiwis;

      $scope.profile.about = about;
      $scope.profile.contact = contact;
      $scope.profile.amount_kiwis = amount_kiwis;
    });
  };

  $scope.updateAbout = function() {
  	commonServices.consumeService('Profile','changeAbout',{
      'about' : $scope.profile.about
    },function(status, resultText, data){
      $scope.aboutChange = false;
      
      if(data.status != 'OK')
        $scope.aboutChange = false;
    });
  }

  $scope.updateContact = function() {
  	commonServices.consumeService('Profile','changeContact',{
      'contact' : $scope.profile.contact
    },function(status, resultText, data){
      $scope.contactChange = false;
      
      if(data.status != 'OK')
        $scope.contactChange = false;
    });
  }

  $scope.getMyFollowers = function() {
    $scope.followers = [];
    commonServices.consumeService('Profile','getMyFollowers',{
    },function(status, resultText, data){
      $scope.followers = data.followers;
    });
  };


  $scope.getMyPosts = function() {
    $scope.posts = [];
    commonServices.consumeService('Publisher','postListByUser',{
      limit : $scope.limit
    },function(status, resultText, data){
      $scope.posts = data.posts;
    });
  };


  $scope.seeMore = function(e) {

    var item = e.currentTarget;

    commonServices.consumeService('Publisher','seeMoreByUser',{
      limit : $scope.limit,
      amount : $scope.posts.length
    },function(status, resultText, data){
      $scope.posts.push.apply($scope.posts, data.posts);

      if(data.posts.length < $scope.limit)
        item.remove();
    });
  };


})



.controller('profileChatCtrl', function($scope, $stateParams, $ionicScrollDelegate, commonServices) {

  $scope.limit = 15;

  $scope.chat = {
    id: $stateParams.chatId
  };

  commonServices.consumeService('Profile','getUserProfile',{},function(status, resultText, data){
  
    $scope.notCurrentUser = true;
    if(data.users[0].id == $stateParams.chatId)
      $scope.notCurrentUser = false;
  });

  $scope.styleBtnFollower = { 
    buttonColor : "button-positive",
    buttonIcon : "ion-checkmark-round",
    buttonLabel : "Seguir"
  };

  $scope.followers = [];
  commonServices.consumeService('Profile','getFollowersById',{
    'id' : $stateParams.chatId
  },function(status, resultText, data){
    $scope.followers = data.followers;
  });

  $scope.posts = [];
  commonServices.consumeService('Publisher','postListByUser',{
    id: $stateParams.chatId,
    limit : $scope.limit
  },function(status, resultText, data){
    $scope.posts = data.posts;
  });

  $scope.seeMore = function(e) {

    var item = e.currentTarget;

    commonServices.consumeService('Publisher','seeMoreByUser',{
      limit : $scope.limit,
      amount : $scope.posts.length
    },function(status, resultText, data){
      $scope.posts.push.apply($scope.posts, data.posts);

      if(data.posts.length < $scope.limit)
        item.remove();
    });
  };

  commonServices.consumeService('Profile','getUserProfileById',{
    id: $stateParams.chatId
  },function(status, resultText, data){

    $scope.picture = data.users[0].image;
    $scope.name = data.users[0].name;
    $scope.about = data.users[0].about;
    $scope.contact = data.users[0].contact;
    $scope.place = data.users[0].city + '('+data.users[0].region+')';
    $scope.amount_kiwis = data.users[0].amount_kiwis;

    if(data.users[0].follow == 'Y')
    {
      $scope.styleBtnFollower = { 
        buttonColor : "button-assertive",
        buttonIcon : "ion-close-round",
        buttonLabel : "Dejar de seguir"
      };
    }

  });


  $scope.updateFollow = function() {
    
      commonServices.consumeService('Profile','updateFollow',{
        user_id2: $stateParams.chatId
      },function(status, resultText, data){

        if(data.status == 'OK')
        {
          if(data.styleBtnFollower == 'Y')
          {
            $scope.styleBtnFollower = { 
              buttonColor : "button-assertive",
              buttonIcon : "ion-close-round",
              buttonLabel : "Dejar de seguir"
            };
          }
          else
          {
            $scope.styleBtnFollower = { 
              buttonColor : "button-positive",
              buttonIcon : "ion-checkmark-round",
              buttonLabel : "Seguir"
            };
          }
        }
      });
  };

})


;