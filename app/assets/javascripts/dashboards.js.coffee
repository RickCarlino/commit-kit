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
]
$ ->
  now = new Date()
  cal = new CalHeatMap()
  cal.init(
    start: new Date(now.getFullYear(), 0, 1),
    domain: "month",
    subDomain: "x_day",
    subDomainTextFormat: "%d",
    data: "http://localhost:3000/api/trackers/1/events.json")
