angular.module('starter.services', [])


.service('commonServices', function($state, $http, UserService, $ionicLoading) {

    var consumeService = function(section, service, data, callback) {

      var user = UserService.getUser();

      $ionicLoading.show({
        template: 'Cargando...'
      });

      if(user.userID && user.accessToken)
      {
        data.section = section;
        data.service = service;
        data.user_id = user.userID;
        data.accessToken = user.accessToken;

        $http({
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          url: 'http://kiwimate.000webhostapp.com/access_point.php',
          dataType: "json",
          method: "POST",
          data: data,
          cache: false
        }).then(function successCallback(response) {
          $ionicLoading.hide();

          if(typeof callback === 'function')
            callback(response.status,  response.resultText, response.data);

        }, function errorCallback(response) {
          $ionicLoading.hide();
          
          error = response.statusText;

          if(typeof callback === 'function')
            callback(false);
        });
      }
      else
      {
        if(typeof callback === 'function')
          callback(false);
      }

    };


    var frontZeros = function(str, max) {
      str = str.toString();
      return str.length < max ? frontZeros("0" + str, max) : str;
    }

    return {
      consumeService: consumeService,
      frontZeros: frontZeros
  };
})

.service('UserService', function($state) {

//for the purpose of this example I will store user data on ionic local storage but you should save it on a database

  var setUser = function(user_data) {
    window.localStorage.starter_facebook_user = JSON.stringify(user_data);
  };

  var getUser = function(){
    return JSON.parse(window.localStorage.starter_facebook_user || '{}');
  };

  var checkLogin = function(user) {
    if(!user.userID)
    {
      getFacebookProfileInfo(success.authResponse)
      .then(function(profileInfo) {

        //for the purpose of this example I will store user data on local storage
        UserService.setUser({
          authResponse: success.authResponse,
          userID: profileInfo.id,
          name: profileInfo.name,
          email: profileInfo.email,
          link: profileInfo.link,
          picture : "http://graph.facebook.com/" + success.authResponse.userID + "/picture?type=large"
        });

        $state.go('app.home');

      }, function(fail){
        //fail get profile info
        console.log('profile info fail', fail);
      });
    }else{
      $state.go('app.home');
    }
  };

  return {
    getUser: getUser,
    setUser: setUser,
    checkLogin: checkLogin
  };
})


;