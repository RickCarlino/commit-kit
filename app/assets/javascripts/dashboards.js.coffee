# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.


# Put routes and configs and stuff in here.

app = angular.module('Dashboard', ['ngResource'])

angular
.module('Dashboard')
.controller "DashboardController", [
  '$scope'
  '$resource'
  ($scope, $resource) ->
    $scope.trackers = $resource('/api/trackers/:id');
    $scope.hello = 'world'
    $scope.trackers.query (a) ->
      debugger
]
