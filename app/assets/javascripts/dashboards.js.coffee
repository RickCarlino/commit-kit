# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.


# Put routes and configs and stuff in here.

app = angular.module('Dashboard', ['ngResource'])

app
.service 'tracker', [
  "$resource"
  ($resource) ->
    $resource('/api/trackers/:id',{},
      query:
        method: "GET"
        isArray: true
        transformResponse: (data, header) ->
          angular.fromJson(data).trackers
    )
]

app
.controller "DashboardController", [
  '$scope'
  'tracker'
  ($scope, tracker) ->
    $scope.trackers = tracker.query()
    $scope.tracker = (new tracker).$save()
    console.log $scope.tracker
]
