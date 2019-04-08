angular.module('publisher.controllers', [])


.controller('postDetailCtrl', function($scope, $stateParams, $ionicScrollDelegate, commonServices, $ionicLoading) {

	$scope.post_id = $stateParams.postId;

	$scope.post = {};  //only do this if $scope.post has not already been declared
	$scope.post.comment = '';

	$scope.user_id = 0;
	$scope.nameUser = '';
	$scope.imageUser = '';

	commonServices.consumeService('Profile','getUserProfile',{},function(status, resultText, data){
      	$scope.user_id = data.users[0].id;
      	$scope.nameUser = data.users[0].name;
		$scope.imageUser = data.users[0].image;
    });

	commonServices.consumeService('Publisher','getPostById',{
		post_id: $stateParams.postId
	},function(status, resultText, data){
		$scope.post = data.posts[0];
	});


	commonServices.consumeService('Publisher','getCommentsPost',{
		post_id: $stateParams.postId
	},function(status, resultText, data){
		
		$scope.commentsPost = data.comments;
	});

	$scope.insertComment = function() {
		
		if($scope.post.comment.length == 0)
			return false;

		commonServices.consumeService('Publisher','insertComment',{
	      'post_id' : $scope.post_id,
	      'comment' : $scope.post.comment,
	      'owner_id' : $scope.post.user_id
	    },function(status, resultText, data){

	      if(data.status == 'OK')
	      {
	      	var comment = {
	      		user_id : $scope.user_id,
	      		image : $scope.imageUser,
				name : $scope.nameUser,
				comment : $scope.post.comment
	      	};

	      	$scope.commentsPost.push(comment);

			$scope.post.comment = '';
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
