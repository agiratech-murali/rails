(function () {
  'use strict';

  angular.module('ContactApp').controller('LoginController', LoginController);

    LoginController.$inject = ['$scope', '$http', 'AuthService', '$location', '$resource'];
    function LoginController($scope, $http, AuthService, $location, $resource) {
      $scope.signIn = function(){
        AuthService.login($scope.email, $scope.password);
      }

    }

})();
