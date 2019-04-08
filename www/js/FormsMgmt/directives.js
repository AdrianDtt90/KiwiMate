angular.module('formsmgmt', [])

.controller('FormsMgmtCtrl', function ($scope, $cordovaCamera, $cordovaFile, $cordovaFileTransfer, 
  $cordovaDevice, $ionicPopup, $cordovaActionSheet, $ionicLoading, commonServices, UserService, $timeout, $compile, 
  $state, $rootScope) {

  $scope.image = null;

  // Get your modal holder element which may be located anywhere in your application
  var modalHolder = angular.element(document.querySelector('#formMgmtContent'));
  if($scope.formParam)
  {
    angular.forEach($scope.formParam.fields, function(field, key) {
      switch(field.type)
      {
        case 'text':
          modalHolder.append($compile('<label class="item item-input item-stacked-label">\
                                <h3 class="input-label">'+field.label+''+ (field.required ? '<span class="input-requided">*</span>' : '')+'</h3>\
                                <input ng-model="'+field.name+'" type="text" placeholder="Ingrese '+field.label+'">\
                              </label>')($scope));
        break;

        case 'date':
          modalHolder.append($compile('<label class="item item-input item-stacked-label">\
                                <h3 class="input-label">'+field.label+''+ (field.required ? '<span class="input-requided">*</span>' : '')+'</h3>\
                                <input ng-model="'+field.name+'" type="date" placeholder="Ingrese '+field.label+'">\
                              </label>')($scope));
        break;

        case 'textarea':
          modalHolder.append($compile('<label class="item item-input item-stacked-label">\
                                <h3 class="input-label">'+field.label+''+ (field.required ? '<span class="input-requided">*</span>' : '')+'</h3>\
                                <textarea ng-model="'+field.name+'" placeholder="Ingrese '+field.label+'"></textarea>\
                              </label>')($scope));
        break;

        case 'image':
          modalHolder.append($compile('<button class="button button-full icon-left ion-camera" ng-click="loadImage()">Subir Imagen</button>\
                              <img ng-src="{{pathForImage(image)}}" ng-if="image" class="full-image">')($scope));
        break;
      }
    });

    switch($scope.formParam.action)
    {
      case 'create':
        modalHolder.append($compile('<button class="button button-full button-balanced" ng-click="submitEvent()">\
                            Crear\
                          </button>')($scope));
      break;
    }
    
  }


  $scope.submitEvent = function() {

    $ionicLoading.show({
      template: 'Aguarde un momento...'
    });
    
    if($scope.validateForm())
    {
      if ($scope.image && $scope.image != null) {
        $scope.uploadImage(function(result){
          $scope.submit();
        });
      }
      else
        $scope.submit();
    }
    else
    {
      $ionicLoading.show({
        template: 'Complete los campos obligatorios',
        duration: 2000
      });
    }
  };

  $scope.validateForm = function() {
    var bResult = true;
    angular.forEach($scope.formParam.fields, function(field, key) {
      if(!$scope[field.name] && field.required)
        bResult = false;
    });

    return bResult;
  };

  $scope.submit = function() {

    var parameters = {
      image: ($scope.image && $scope.image != null) ? 'http://kiwimate.000webhostapp.com/uploads-post/'+$scope.image : ''
    }
    angular.forEach($scope.formParam.fields, function(field, key) {
      switch(field.type)
      {
        case 'text':
        case 'textarea':
          parameters[field.name] = $scope[field.name];
        break;

        case 'date':
          if($scope[field.name])
          {
            var date = $scope[field.name];
            $scope.date = date.getFullYear() + '-' + commonServices.frontZeros(date.getMonth()+1,2) + '-' + commonServices.frontZeros(date.getDate(),2);
          }
        break;
      }
    });

    commonServices.consumeService($scope.formParam.section, $scope.formParam.service, parameters,
      function(status, resultText, data){
      
      $ionicLoading.hide();

      if(status == 'OK' || status == 200)
      {
        $rootScope.$broadcast($scope.formParam.returnEvent);

        $state.go($scope.formParam.pageReturn);
        $scope.image = null;
      }
      else
      {
        $ionicLoading.show({
          template: 'Ocurrió un error, intentá nuevamente...',
          duration: 3000
        });
      }
    });
  };








  //Images Staff
  //-----------------------------------------------------------------------------------------------
  //-----------------------------------------------------------------------------------------------
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

.directive('formsmgmt', function() {
  return {
    restrict: 'E',
    transclude: true,
    scope: {
      formParam: '='
    },
    templateUrl: 'js/FormsMgmt/templates/fromTemplate.html',
    controller: 'FormsMgmtCtrl'
  };
})


;