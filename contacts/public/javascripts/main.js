(function () {
  'use strict';

  angular
    .module('ContactApp', ['ngResource', 'ngRoute'])
    .config(config)
    .run(run);

  config.$inject = ['$routeProvider', '$locationProvider'];
  function config($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        controller: 'ContactsController',
        templateUrl: 'templates/contacts/index.html'
      })
      .when('/contacts', {
        controller: 'ContactsController',
        templateUrl: 'templates/contacts/index.html'
      })
      .when('/contacts/new', {
        controller: 'ContactsController',
        templateUrl: 'templates/contacts/new.html'
      })
      .when('/contacts/:contact_id/edit', {
        controller: 'ContactsController',
        templateUrl: 'templates/contacts/edit.html'
      })
      .when('/login', {
        controller: 'LoginController',
        templateUrl: 'templates/login/form.html'
      })
      .when('/register', {
        controller: 'RegistrationController',
        templateUrl: 'templates/registrations/form.html'
      })
      .otherwise({ redirectTo: '/login' });
  }

  run.$inject = ['$rootScope', '$location', 'AuthService'];
  function run($rootScope, $location, AuthService) {
    if(AuthService.notAuthenticated)
    {
      $location.path('/login')
    }
  }

})();