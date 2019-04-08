angular.module('publisher', [])

.controller('publisherCtrl', function ($scope, $rootScope, $cordovaCamera, $cordovaFile, $cordovaFileTransfer, 
  $cordovaDevice, $ionicPopup, $cordovaActionSheet, $ionicLoading, commonServices, UserService, $timeout) {
  $scope.image = null;

  var user = UserService.getUser();
  $scope.username = user.name;
  $scope.picture = user.picture;

  var date = new Date();
  $scope.date = date.getFullYear() + '-' + commonServices.frontZeros(date.getMonth()+1,2) + '-' + commonServices.frontZeros(date.getDate(),2);
 
  $scope.showAlert = function(title, msg) {
    var alertPopup = $ionicPopup.alert({
      title: title,
      template: msg
    });
  };

  $scope.loadImage = function() {
    var options = {
      title: 'Seleccionar fuente',
      buttonLabels: ['Imagen Libreria', 'Usar Camara'],
      addCancelButtonWithLabel: 'Cancelar',
      androidEnableCancelButton : true,
    };
    $cordovaActionSheet.show(options).then(function(btnIndex) {
      var type = null;
      if (btnIndex === 1) {
        type = Camera.PictureSourceType.PHOTOLIBRARY;
      } else if (btnIndex === 2) {
        type = Camera.PictureSourceType.CAMERA;
      }
      if (type !== null) {
        $scope.selectPicture(type);
      }
    });
  };

  $scope.publishPost = function() {

    $ionicLoading.show({
      template: 'Subiendo post...'
    });

    if ($scope.image && $scope.image != null) {
      $scope.uploadImage(function(result){
        $scope.publish();
      });
    }
    else
      $scope.publish();
  };

  $scope.publish = function() {

    var date = new Date();

    commonServices.consumeService('Publisher','publishPost',{
      "image": ($scope.image && $scope.image != null) ? 'http://kiwimate.000webhostapp.com/uploads-post/'+$scope.image : '',
      "content": $scope.content,
      "date": date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate()
    },function(status, resultText, data){
      
      if(status == 'OK' || status == 200)
      {
        $scope.content = '';
        $scope.image = null;

        //update postlist
        $rootScope.$broadcast('updated-postlist');
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

  $scope.uploadImage = function(callback) {
    // Destination URL
    var url = "http://kiwimate.000webhostapp.com/uploads-post.php";
   
    // File for Upload
    var targetPath = $scope.pathForImage($scope.image);
   
    // File name only
    var filename = $scope.image;
   
    var options = {
      fileKey: "file",
      fileName: filename,
      chunkedMode: false,
      mimeType: "multipart/form-data",
      params : {'fileName': filename}
    };

    $cordovaFileTransfer.upload(url, targetPath, options).then(function(result) {
      //$scope.showAlert('Success', 'Imagen subida correctamente.');
      if(typeof callback === 'function')
        callback(result);
    },function(error){
      console.log("Error: ",JSON.stringify(error));
    });
  }


  // Returns the local path inside the app for an image
  $scope.pathForImage = function(image) {
    if (image === null) {
      return '';
    } else {
      return cordova.file.dataDirectory + image;
    }
  };
 


  // Take image with the camera or from library and store it inside the app folder
  // Image will not be saved to users Library.
  $scope.selectPicture = function(sourceType) {
    var options = {
      quality: 100,
      destinationType: Camera.DestinationType.FILE_URI,
      sourceType: sourceType,
      saveToPhotoAlbum: false
    };
   
    $cordovaCamera.getPicture(options).then(function(imagePath) {
      // Grab the file name of the photo in the temporary directory
      var currentName = imagePath.replace(/^.*[\\\/]/, '');
   
      //Create a new name for the photo
      var d = new Date(),
      n = d.getTime(),
      newFileName =  n + ".jpg";
   
      // If you are trying to load image from the gallery on Android we need special treatment!
      if ($cordovaDevice.getPlatform() == 'Android' && sourceType === Camera.PictureSourceType.PHOTOLIBRARY) {
        window.FilePath.resolveNativePath(imagePath, function(entry) {
          window.resolveLocalFileSystemURL(entry, success, fail);
          function fail(e) {
            console.error('Error: ', e);
          }
   
          function success(fileEntry) {
            var namePath = fileEntry.nativeURL.substr(0, fileEntry.nativeURL.lastIndexOf('/') + 1);
            // Only copy because of access rights
            $cordovaFile.copyFile(namePath, fileEntry.name, cordova.file.dataDirectory, newFileName).then(function(success){
              $scope.image = newFileName;
            }, function(error){
              $scope.showAlert('Error', error.exception);
            });
          };
        }
      );
      } else {
        var namePath = imagePath.substr(0, imagePath.lastIndexOf('/') + 1);
        // Move the file to permanent storage
        $cordovaFile.moveFile(namePath, currentName, cordova.file.dataDirectory, newFileName).then(function(success){
          $scope.image = newFileName;
        }, function(error){
          $scope.showAlert('Error', error.exception);
        });
      }
    },
    function(err){
      // Not always an error, maybe cancel was pressed...
    })
  };
 
})


.controller('postListCtrl', function ($scope, $cordovaCamera, $cordovaFile, $cordovaFileTransfer, 
  $cordovaDevice, $ionicPopup, $cordovaActionSheet, $ionicLoading, commonServices, UserService) {

  $scope.user = UserService.getUser();
  $scope.limit = 15;

  $scope.posts = [];
  $scope.updatePostList = function() {
    $scope.posts = [];
    commonServices.consumeService('Publisher','postList',{
      limit : $scope.limit
    },function(status, resultText, data){
      $scope.posts = data.posts;
    });
  };

  $scope.seeMore = function(e) {

    var item = e.currentTarget;

    commonServices.consumeService('Publisher','seeMore',{
      limit : $scope.limit,
      amount : $scope.posts.length
    },function(status, resultText, data){
      $scope.posts.push.apply($scope.posts, data.posts);

      if(data.posts.length < $scope.limit)
        item.remove();
    });
  };

  $scope.updatePostList();

  $scope.$on('updated-postlist', function(event, profileObj) {
    $scope.updatePostList();    
  });

  $scope.deletePost = function(e) {

    var post_id = e.currentTarget.parentNode.parentNode.parentNode.attributes['data-id'].value;
    var item = e.currentTarget.parentNode.parentNode.parentNode;

    commonServices.consumeService('Publisher','deletePost',{
      post_id: post_id
    },function(status, resultText, data){

      if(data.status == 'OK')
        angular.element(item).remove();
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

.directive('publisher', function() {
  return {
    restrict: 'E',
    transclude: true,
    scope: {},
    templateUrl: 'js/Publisher/templates/publisher.html',
    controller: 'publisherCtrl'
  };
})


.directive('postlist', function() {
  return {
    restrict: 'E',
    transclude: true,
    scope: {},
    templateUrl: 'js/Publisher/templates/postList.html',
    controller: 'postListCtrl'
  };
})

;