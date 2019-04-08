angular.module('profile.services', [])

.factory('Profile', function(UserService) {
  // Might use a resource here that returns a JSON array

  return {
    getLoggedProfile: function() {
      return UserService.getUser();
    }
  };
});
