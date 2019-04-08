angular.module('places.controllers', [])

.controller('PlacesCtrl', function($scope, $state, Places, UserService) {
  // default value
  	$scope.limit = 15;

	$scope.places = [];
	$scope.search = {
	inputSearch : ''
	};

	$scope.user = UserService.getUser();


	function initialize() {
		// set up begining position
		var myLatlngMap = new google.maps.LatLng(-36.8714836,174.8256027);

		// set option for map
		var mapOptions = {
			center: myLatlngMap,
			zoom: 10,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};

		// init map
		var map = new google.maps.Map(document.getElementById("map"),
		mapOptions);

		$scope.arrayMarkets = [];
		angular.forEach($scope.places, function(place, index) {

			place.idMarket = index;

			var myLatlng = new google.maps.LatLng(place.x,place.y);

			// init info window 
			var contentString = '<div class="content">'+
				'<h1 class="firstHeading">'+place.name+'</h1>'+
				'<img class="image-place" src="'+place.thumb+'">'+
				'<h5 class="secondHeading">'+place.type+'</h5>'+
				'<div class="bodyContent">'+
					'<p>'+place.content+'</p>'+
					'</br>'+
					'<p>'+place.address+'</p>'+
				'</div>'+
			'</div>';

			var infowindow = new google.maps.InfoWindow({
				content: contentString
			});

			// Market
			var marker = new google.maps.Marker({
				position: myLatlng,
				map: map,
				title: place.name,
				label: place.letter,
				animation: google.maps.Animation.DROP
			});

			marker.addListener('click', function() {
				if($scope.infoWindows)
					$scope.infoWindows.close();

				$scope.infoWindows = infowindow;
				$scope.infowindow = infowindow.open(map, marker);
			});

			$scope.arrayMarkets.push(marker);
		});

		// assign to stop
		$scope.map = map;
	}

	// load map when the ui is loaded
	$scope.init = function() {
		Places.getAllPlaces({
		  limit: $scope.limit,
		  search: $scope.search.inputSearch
		}, function(places){
			$scope.places = places;
			initialize();
		});
	}

	$scope.showPlace = function(placeId) {
		var place;
		for (var i = 0; i < $scope.places.length; i++) {
			if ($scope.places[i].id === parseInt(placeId)) {
			  place = $scope.places[i];
			  break;
			}
		}

		if(place)
		{
			var latLng = new google.maps.LatLng(place.x,place.y);
			$scope.map.setCenter(latLng);

			google.maps.event.trigger($scope.arrayMarkets[place.idMarket], 'click');
		}
	}


	$scope.seeMore = function(e) {

		var item = e.currentTarget;

		Places.seeMore({
		  limit: $scope.limit, 
		  places: $scope.places,
		  search: $scope.search.inputSearch
		}, function(places){
		  $scope.places.push.apply($scope.places, places);
		  initialize();
		  if(places.length < $scope.limit)
		    item.remove();
		});
	};

	$scope.searchEvent = function() {
		Places.getAllPlaces({
		  limit: $scope.limit,
		  search: $scope.search.inputSearch
		}, function(places){
		  $scope.places = places;
		  initialize();
		});
	};

  

})


;