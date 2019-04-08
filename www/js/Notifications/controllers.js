angular.module('notifications.controllers', [])

.controller('notificationsListCtrl', function($scope, $rootScope, $state, commonServices) {
  
	$scope.limit = 10;
	$scope.buttons;

	$rootScope.amountNotifications = 0;

	commonServices.consumeService('Notifications','getNotifications',{
		limit : $scope.limit
	},function(status, resultText, data){

		var newData = setNotifications(data);
		$scope.notifications = newData.notifications;
	});


	$scope.seeMore = function(e) {

		var item = e.currentTarget;

		commonServices.consumeService('Notifications','seeMore',{
		  limit : $scope.limit,
		  amount : $scope.notifications.length
		},function(status, resultText, data){
			var newData = setNotifications(data);
		  	$scope.notifications.push.apply($scope.notifications, newData.notifications);

		  if(data.notifications.length < $scope.limit)
		    item.remove();
		});
	};


	$scope.readNotification = function(e) {

		var notification_id = e.currentTarget.attributes['data-id'].value;
		var item = e.currentTarget;
		commonServices.consumeService('Notifications','readNotification',{
			'notification_id' : notification_id
		},function(status, resultText, data){

			angular.element(item).addClass("notify-read");
			$rootScope.amountNotifications --;

			if(data.status != 'OK')
			{
				angular.element(item).removeClass("notify-read");
				$rootScope.amountNotifications ++;
			}
		});
	};


	var setNotifications = function(data) {
		angular.forEach(data.notifications, function(notification, key) {
			if(notification.entity == 'post')
			{
				switch(notification.action)
				{
					case 'comment_to_owner':
						notification.text = 'El kiwimate <b>'+notification.username_notif+'</b> ha comentado tu post.';
						notification.href = '#/post/';
					break;
					case 'comment_notice':
						notification.text = 'El kiwimate <b>'+notification.username_notif+'</b> ha comentado en un post en el que participas.';
						notification.href = '#/post/';
					break;
					case 'new':
						notification.text = 'Tu kiwimate <b>'+notification.username_notif+'</b> publicó una nueva publicación.';
						notification.href = '#/post/';
					break;
					case 'like':
						notification.text = 'Has obtenido un <b>nuevo kiwi</b>.';
						notification.href = '#/post/';
					break;
				}
			}

			if(notification.entity == 'chat')
			{
				switch(notification.action)
				{
					case 'message':
						notification.text = 'Tienes nuevos mensajes de tu kiwimate <b>' + notification.username_notif + '</b>';
						notification.href = '#/chats/';
					break;					
				}
			}

			if(notification.viewed == 'N')
				$rootScope.amountNotifications ++;
		});

		return data;
	};

})
;