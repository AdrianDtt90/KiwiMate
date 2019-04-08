angular.module('starter.controllers', [])

// Authentication controller
// Put your login, register functions here
.controller('AuthCtrl', function($scope, $state, $q, $ionicHistory, UserService, commonServices, $ionicLoading, StorageService) {
  // hide back butotn in next view
  $ionicHistory.nextViewOptions({
    disableBack: true
  });


  // INICIO Login Facebook
  //------------------------------------------------------------------------------
  //------------------------------------------------------------------------------
  var checkLogin = function() {
    $ionicLoading.show({
      template: 'Cargando...'
    });

    facebookConnectPlugin.getLoginStatus(function(success){
      if(success.status == "connected")
        $state.go('home');
      $ionicLoading.hide();
    });
  };

  window.fbAsyncInit = function() {
    //Se utiliza este metodo fbAsyncInit para ejecutarse DESPUES de cargar e inicializar el SDK
    checkLogin();
  };

  //This is the success callback from the login method
  var fbLoginSuccess = function(response) {

    if (!response.authResponse){
      fbLoginError("Cannot find the authResponse");
      return;
    }

    facebookConnectPlugin.getAccessToken(function(token) {

        var authResponse = response.authResponse;

        getFacebookProfileInfo(authResponse)
        .then(function(profileInfo) {
          //for the purpose of this example I will store user data on local storage
          UserService.setUser({
            authResponse: authResponse,
            accessToken: token,
            userID: profileInfo.id,
            name: profileInfo.name,
            email: profileInfo.email,
            link: profileInfo.link,
            picture : "http://graph.facebook.com/" + authResponse.userID + "/picture?type=large"
          });

          //Add user to db if he doesn't exist
          commonServices.consumeService('Auth','manageUser',{
            "username": profileInfo.name,
            "name": profileInfo.name,
            "image": 'http://graph.facebook.com/' + authResponse.userID + '/picture?type=large',
            "about": "----",
            "contact": "----"
          },function(status, resultText){
            if(status == 'OK' || status == 200)
            {
              $ionicLoading.hide();
              $state.go('home');
            }
          });

        }, function(fail){
          //fail get profile info
          console.log('profile info fail', fail);
        });
    }, function(err) {
        console.log("Could not get access token: " + err);
    });
  };


  //This is the fail callback from the login method
  var fbLoginError = function(error){
    console.log('fbLoginError '+ JSON.stringify(error));
    $ionicLoading.hide();
  };

  //this method is to get the user profile info from the facebook api
  var getFacebookProfileInfo = function (authResponse) {
    var info = $q.defer();

    facebookConnectPlugin.api('/me?fields=email,name,link&access_token=' + authResponse.accessToken, null,
      function (response) {
        console.log(response);
        info.resolve(response);
      },
      function (response) {
        console.log(response);
        info.reject(response);
      }
    );
    return info.promise;
  };

  //This method is executed when the user press the "Login with facebook" button
  $scope.facebookSignIn = function() {

    facebookConnectPlugin.getLoginStatus(function(success){
     if(success.status === 'connected'){
        // the user is logged in and has authenticated your app, and response.authResponse supplies
        // the user's ID, a valid access token, a signed request, and the time the access token
        // and signed request each expire
        console.log('getLoginStatus', success.status);

        //check if we have our user saved
        var user = UserService.getUser('facebook');

        if(!user.userID)
        {
          facebookConnectPlugin.getAccessToken(function(token) {

            getFacebookProfileInfo(success.authResponse)
            .then(function(profileInfo) {
              //for the purpose of this example I will store user data on local storage
              UserService.setUser({
                authResponse: success.authResponse,
                accessToken: token,
                userID: profileInfo.id,
                name: profileInfo.name,
                email: profileInfo.email,
                link: profileInfo.link,
                picture : "http://graph.facebook.com/" + success.authResponse.userID + "/picture?type=large"
              });

              $state.go('home');

            }, function(fail){
              //fail get profile info
              console.log('profile info fail', fail);
            });
            
          }, function(err) {
                console.log("Could not get access token: " + err);
          });
        }else{
          $state.go('home');
        }

     } else {
        //if (success.status === 'not_authorized') the user is logged in to Facebook, but has not authenticated your app
        //else The person is not logged into Facebook, so we're not sure if they are logged into this app or not.
        console.log('getLoginStatus', success.status);

        $ionicLoading.show({
          template: 'Logging in...'
        });

        //ask the permissions you need. You can learn more about FB permissions here: https://developers.facebook.com/docs/facebook-login/permissions/v2.4
        facebookConnectPlugin.login(['email', 'public_profile'], fbLoginSuccess, fbLoginError);
      }
    });
  };
  //------------------------------------------------------------------------------
  //------------------------------------------------------------------------------
  // FIN Login Facebook

})

.controller('ProfileInfoCtrl', function($scope, $state, UserService) {
  $scope.user = UserService.getUser();
})

// Home controller
.controller('HomeCtrl', function($scope, $rootScope, $state, commonServices) {
  $scope.title = "KiwiMate";

  commonServices.consumeService('Profile','getUserProfile',{},function(status, resultText, data){
    var flag = 1;
    setInterval(function(){
      $scope.$apply(function () {
      switch(flag) {
        case 1:
          $scope.title = 'Tiene '+data.users[0].amount_kiwis+' kiwis recolectados';
          flag = 2;
        break;

        case 2:
          $scope.title = 'Se encuentra en '+data.users[0].city;
          flag = 3;
        break;

        case 3:
          $scope.title = 'Kiwimate';
          flag = 1;
        break;
      }
    });

    }, 2000);
  });

})

// Information controller
.controller('InformationCtrl', function($scope, $state) {})

// Ticket controller
.controller('TicketCtrl', function($scope, $state) {
    // set default value for input form
    $scope.depDate = new Date();
    $scope.returnDate = new Date();
    $scope.aldult = 2;
    $scope.children = 1;
    $scope.infants = 0;
  })

// Nearby controller
.controller('NearbyCtrl', function($scope, $state, Places) {
  // get list places form Places model
  $scope.places = Places.all();

  function initialize() {
    // set up begining position
    var myLatlng = new google.maps.LatLng(21.0227358,105.8194541);

    // set option for map
    var mapOptions = {
      center: myLatlng,
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    // init map
    var map = new google.maps.Map(document.getElementById("map"),
      mapOptions);

    // assign to stop
    $scope.map = map;
  }
  // load map when the ui is loaded
  $scope.init = function() {
    initialize();
  }
})

// Weather controller
.controller('WeatherCtrl', function($scope, $state, Weather) {
   // get list days from Weather model
  $scope.days = Weather.all();

  // today weather
  $scope.today = $scope.days[0];
})

// Gallery controller
.controller('GalleryCtrl', function($scope, $state, Photos) {
  // get list photos from Photos service
  $scope.photos = Photos.all();

})

// Friends
.controller('FriendsCtrl', function($scope, $state, Friends) {
  // get list photos from Photos service
  $scope.friends = Friends.all();

})

.controller('TaxiCtrl', function($scope, $state) {
    function initialize() {
      // set up begining position
      var myLatlng = new google.maps.LatLng(21.0227358,105.8194541);

      // set option for map
      var mapOptions = {
        center: myLatlng,
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      // init map
      var map = new google.maps.Map(document.getElementById("map"),
        mapOptions);

      // assign to stop
      $scope.map = map;
    }
    // load map when the ui is loaded
    $scope.init = function() {
      initialize();
    }
})

.controller('ShoppingCtrl', function($scope, $state, Places) {
  // get list places form Places model
  $scope.places = Places.all();
})


.controller('LogoutCtrl', function($scope, UserService, $ionicActionSheet, $state, $ionicLoading) {
  
  $scope.user = UserService.getUser();

  $scope.showLogOutMenu = function() {

    var hideSheet = $ionicActionSheet.show({
      destructiveText: 'Cerrar Sesión',
      titleText: 'Estas seguro que queres cerrar sesión?',
      cancelText: 'Cancelar',
      cancel: function() {},
      buttonClicked: function(index) {
        return true;
      },
      destructiveButtonClicked: function(){
        $ionicLoading.show({
          template: 'Logging out...'
        });

        //facebook logout
        facebookConnectPlugin.logout(function(){
          $ionicLoading.hide();
          $state.go('login');
        },
        function(fail){
          $ionicLoading.hide();
        });
      }
    });
  };

})

// Currency controller
.controller('CurrencyCtrl', function($scope, $state) {
  // default value
  $scope.from = 1000;

})

// Chat controller, view list chats and chat detail
.controller('ChatCtrl', function($scope, Chats) {
  $scope.chats = Chats.all();

  // remove a conversation
  $scope.remove = function(chat) {
    Chats.remove(chat);
  };

  // mute a conversation
  $scope.mute = function(chat) {
    // write your code here
  }
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats, $ionicScrollDelegate, $ionicActionSheet, $timeout) {
  //$scope.chat = Chats.get($stateParams.chatId);
  $scope.chat = Chats.get(0);

  $scope.sendMessage = function() {
    var message = {
      type: 'sent',
      time: 'Just now',
      text: $scope.input.message
    };

    $scope.input.message = '';

    // push to massages list
    $scope.chat.messages.push(message);

    $ionicScrollDelegate.$getByHandle('mainScroll').scrollBottom();
  };

  // hover menu
  $scope.onMessageHold = function(e, itemIndex, message) {
    // show hover menu
    $ionicActionSheet.show({
      buttons: [
        {
          text: 'Copy Text'
        }, {
          text: 'Delete Message'
        }
      ],
      buttonClicked: function(index) {
        switch (index) {
          case 0: // Copy Text
            //cordova.plugins.clipboard.copy(message.text);

            break;
          case 1: // Delete
            // no server side secrets here :~)
            $scope.chat.messages.splice(itemIndex, 1);
            break;
        }

        return true;
      }
    });
  };

});
