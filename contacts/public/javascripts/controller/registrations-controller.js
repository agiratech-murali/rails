(function () {
  'use strict';

  angular.module('ContactApp').controller('RegistrationController', RegistrationController);

  RegistrationController.$inject = ['$scope', '$http', 'AuthService', '$location', '$resource'];

  function RegistrationController($scope, $http, AuthService, $location, $resource) {
    $scope.signUp = function(){
      var user_params = { 'first_name': $scope.name, 'email': $scope.email, 'password': $scope.password, 'password_confirmation': $scope.password_confirmation }
      $http.post('/users', { 'user': user_params }).
        success(function (response) {
          if(response.status == "success"){
            storeUserCredentials(response.data.api_key);
            $location.path('/contacts')
          } else{
            console.log("Invalid login");
          }
        })
        .error(function (data) {
          console.log("Invalid details");
        });
    }

    function storeUserCredentials(api_key) {
      var CONTACT_API_TOKEN;
      $http.defaults.headers.common['api_key'] = api_key;
      window.localStorage.setItem(CONTACT_API_TOKEN, api_key);
    }
  }

})();
