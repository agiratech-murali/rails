(function () {
  'use strict';

  angular.module('ContactApp').controller('ContactsController', ContactsController);

  ContactsController.$inject = ['$scope', '$routeParams', '$http', 'AuthService', '$location', '$resource'];
  function ContactsController($scope, $routeParams, $http, AuthService, $location, $resource) {
    $scope.contacts = []
    $scope.contact = {}
    $scope.load = function(){
      $http.get('/contacts').
        success(function (response) {
          $scope.contacts = response.data;
        })
        .error(function (data) {
          console.log(data);
      });
    }

    $scope.new = function(){
      $scope.contact ={}
    }

    $scope.create = function(){
      $http.post('/contacts', { 'contact': $scope.contact }).
        success(function (response) {
          if(response.status == "success"){
            $location.path('/contacts')
          } else{
            console.log("Record Invalid");
          }
        })
        .error(function (data) {
          console.log(data);
      });
    }

    $scope.show = function(){
      $http.get('/contacts/'+$routeParams.contact_id).
        success(function (response) {
          if(response.status == "success"){
            $scope.contact = response.data;
          } else{
            console.log("Record Invalid");
          }
        })
        .error(function (data) {
          console.log(data);
      });
    }

    $scope.update = function(){
      $http.put('/contacts/'+$routeParams.contact_id, { 'contact': $scope.contact }).
        success(function (response) {
          if(response.status == "success"){
            $location.path('/contacts')
          } else{
            console.log("Record Invalid");
          }
        })
        .error(function (data) {
          console.log(data);
      });
    }

    $scope.remove = function(index) {
      var contact = $scope.contacts[index];
      $scope.destroy(contact.slug);
    };

    $scope.destroy = function(contact_id){
      console.log(contact_id)
      $http.delete('/contacts/'+contact_id).
        success(function (response) {
          if(response.status == "success"){
            $scope.load()
          } else{
            console.log("Record Invalid");
          }
        })
        .error(function (data) {
          console.log(data);
      });
    };

    $scope.logout = function()
    {
      AuthService.logout();
    }

  }
})();
