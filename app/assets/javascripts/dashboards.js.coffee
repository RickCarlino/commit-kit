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
  cal = new CalHeatMap()
  now = new Date()
  cal.init
    start: new Date(now.getFullYear(), 0, 1)
    id : "graph_k",
    domain : "month",
    subDomain : "x_day",
    range : 12,
    cellsize: 15,
    cellpadding: 3,
    cellradius: 5,
    domainGutter: 15,
    weekStartOnMonday: 0,
    scale: [40, 60, 80, 100]
    data: "http://localhost:3000/api/trackers/1/events.json"
