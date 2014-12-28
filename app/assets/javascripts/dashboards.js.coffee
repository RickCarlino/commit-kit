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
  '$http'
  'tracker'
  ($scope, $http, tracker) ->
    $scope.trackers = tracker.query()
    $scope.addEvent = (trk) =>
      good = -> location.reload()
      bad  = -> alert "Nope. Something went wrong."
      $http.post("api/trackers/#{trk.id}/events/", {}).success(good).error(bad)
    $scope.addTracker = ->
      cal = new tracker
      cal.name = prompt("What shall we call this calendar?") || 'Untitled'
      cal.$save((_nope, _no) -> location.reload())
    $scope.removeTracker = (trk) ->
      if confirm('Seriously?') && confirm('Are you sure?')
        trk.$delete({id: trk.id}, -> location.reload())
]
