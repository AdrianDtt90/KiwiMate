// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.services' is found in services.js
// 'starter.controllers' is found in controllers.js
// 'nl2brl' is found in lib/angular-nl2br
// 'monospaced.elastic' is found in lib/angular-elastic
// 'ion-gallery' is found in lib/ion-gallery
//
angular.module('starter', ['ionic', 'ngCordova', 'starter.controllers', 'starter.services', 'publisher',
  'nl2br', 'monospaced.elastic', 'ion-gallery','factories','ngStorage', 
  'info.controllers', 'info.services', 
  'profile.controllers', 'profile.services',
  'places.controllers', 'places.services',
  'jobs.controllers', 'jobs.services',
  'buysells.controllers', 'buysells.services',
  'hosts.controllers', 'hosts.services',
  'events.controllers', 'events.services',
  'dictionary.controllers', 'dictionary.services',
  'kiwilikes','regions','chats',
  'publisher.controllers', 'notifications.controllers',
  'formsmgmt'])

.run(function($ionicPlatform, $ionicLoading, $state) {
  $ionicPlatform.ready(function() {

    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }

    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }

    var checkLogin = function() {
      $ionicLoading.show({
        template: 'Cargando...'
      });

      facebookConnectPlugin.getLoginStatus(function(success){
        if(success.status == "connected")
          $state.go('home');
        else
          $state.go('login');

        $ionicLoading.hide();
      });
    };

    facebookConnectPlugin.browserInit('1275764792516077');
    checkLogin();
    
  });
})

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider

  // Home screen - KiwiMate >>>>
  .state('info', {
    url: '/info',
    templateUrl: 'js/Info/templates/info-list.html',
    controller: 'InfoCtrl'
  })

  .state('profile', {
    url: '/profile',
    templateUrl: 'js/Profile/templates/profile-detail.html',
    controller: 'ProfileCtrl'
  })

  .state('places', {
    url: '/places',
    templateUrl: 'js/Places/templates/places-list.html',
    controller: 'PlacesCtrl'
  })

  .state('jobs', {
    url: '/jobs',
    templateUrl: 'js/Jobs/templates/jobs-list.html',
    controller: 'JobsCtrl',
    params : {
      data:{}
    }
  })

  .state('add-jobs', {
    url: '/add-jobs',
    templateUrl: 'js/Jobs/templates/add-job.html',
    controller: 'AddJobsCtrl'
  })

  .state('buysells', {
    url: '/buysells',
    templateUrl: 'js/BuySells/templates/buysells-list.html',
    controller: 'BuySellsCtrl'
  })

  .state('add-buysells', {
    url: '/add-buysells',
    templateUrl: 'js/BuySells/templates/add-buysell.html',
    controller: 'AddBuySellsCtrl'
  })

  .state('hosts', {
    url: '/hosts',
    templateUrl: 'js/Hosts/templates/hosts-list.html',
    controller: 'HostsCtrl'
  })

  .state('events', {
    url: '/events',
    templateUrl: 'js/Events/templates/events-list.html',
    controller: 'EventsCtrl'
  })

  .state('add-events', {
    url: '/add-events',
    templateUrl: 'js/Events/templates/add-event.html',
    controller: 'AddEventsCtrl'
  })

  .state('dictionary', {
    url: '/dictionary',
    templateUrl: 'js/Dictionary/templates/sentences-list.html',
    controller: 'DictionaryCtrl'
  })

  .state('chats', {
    url: '/chats',
    templateUrl: 'js/Chats/templates/chat-list.html',
    controller: 'chatListCtrl'
  })

  .state('chat-detail', {
    url: '/chats/:chatId',
    templateUrl: 'js/Chats/templates/chat-detail.html',
    controller: 'chatDetailCtrl'
  })

  .state('profile-chat', {
    url: '/profile-chat/:chatId',
    templateUrl: 'js/Profile/templates/profile-chat.html',
    controller: 'profileChatCtrl'
  })

  .state('post-detail', {
    url: '/post/:postId',
    templateUrl: 'js/Publisher/templates/post-detail.html',
    controller: 'postDetailCtrl'
  })

  .state('my-chats', {
    url: '/my-chats',
    templateUrl: 'js/Chats/templates/my-chat-list.html',
    controller: 'myChatListCtrl'
  })

  .state('notifications', {
    url: '/notifications',
    templateUrl: 'js/Notifications/templates/notifications-list.html',
    controller: 'notificationsListCtrl'
  })





  .state('info-item-1', {
    url: '/info/1',
    templateUrl: 'js/Info/templates/info-item-1.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-2', {
    url: '/info/2',
    templateUrl: 'js/Info/templates/info-item-2.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-3', {
    url: '/info/3',
    templateUrl: 'js/Info/templates/info-item-3.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-4', {
    url: '/info/4',
    templateUrl: 'js/Info/templates/info-item-4.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-5', {
    url: '/info/5',
    templateUrl: 'js/Info/templates/info-item-5.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-6', {
    url: '/info/6',
    templateUrl: 'js/Info/templates/info-item-6.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-7', {
    url: '/info/7',
    templateUrl: 'js/Info/templates/info-item-7.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-8', {
    url: '/info/8',
    templateUrl: 'js/Info/templates/info-item-8.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-9', {
    url: '/info/9',
    templateUrl: 'js/Info/templates/info-item-9.html',
    controller: 'InfoDetailCtrl'
  })

  .state('info-item-10', {
    url: '/info/10',
    templateUrl: 'js/Info/templates/info-item-10.html',
    controller: 'InfoDetailCtrl'
  })























   // login screen
  .state('login', {
    url: '/login',
    templateUrl: 'templates/login.html',
    controller: 'AuthCtrl'
  })

  // register screen
  .state('register', {
    url: '/register',
    templateUrl: 'templates/register.html',
    controller: 'AuthCtrl'
  })

  // Home screen
  .state('home', {
    url: '/home',
    templateUrl: 'templates/home.html',
    controller: 'HomeCtrl'
  })

  // City information
  .state('information', {
    url: '/information',
    templateUrl: 'templates/information.html',
    controller: 'InformationCtrl'
  })

  // Show nearby places
  .state('nearby', {
    url: '/nearby',
    templateUrl: 'templates/nearby.html',
    controller: 'NearbyCtrl'
  })

  // Book flight ticket
  .state('ticket', {
    url: '/ticket',
    templateUrl: 'templates/ticket.html',
    controller: 'TicketCtrl'
  })

   // Weather
  .state('weather', {
    url: '/weather',
    templateUrl: 'templates/weather.html',
    controller: 'WeatherCtrl'
  })

   // Gallery
  .state('gallery', {
    url: '/gallery',
    templateUrl: 'templates/gallery.html',
    controller: 'GalleryCtrl'
  })

  // Friends nearby
  .state('friends', {
    url: '/friends',
    templateUrl: 'templates/friends.html',
    controller: 'FriendsCtrl'
  })

  // Book a taxi
  .state('taxi', {
    url: '/taxi',
    templateUrl: 'templates/taxi.html',
    controller: 'TaxiCtrl'
  })

  // Find a shop
  .state('shopping', {
    url: '/shopping',
    templateUrl: 'templates/shopping.html',
    controller: 'ShoppingCtrl'
  })

  // Convert currency
  .state('currency', {
    url: '/currency',
    templateUrl: 'templates/currency.html',
    controller: 'CurrencyCtrl'
  })

  // Chat list
  .state('chats2', {
    url: '/chats2',
    templateUrl: 'templates/chats.html',
    controller: 'ChatCtrl'
  })

  .state('chat-detail2', {
    url: '/chats2/:chatId',
    templateUrl: 'templates/chat-detail.html',
    controller: 'ChatDetailCtrl2'
  })

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/login');

});
