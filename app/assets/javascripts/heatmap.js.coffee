directive =
  restrict: 'E'
  scope:
    graph: '='
  link: (scope, el, attr) ->
    now = new Date()
    cal = new CalHeatMap()
    config =
      start: new Date(now.getFullYear(), 0, 1),
      itemSelector: el[0],
      domain: "month",
      subDomain: "x_day",
      subDomainTextFormat: "%d",
      data: eval(attr.graph)
    console.log config.data
    cal.init(config)

  controller: ['$scope', ($scope) ->
  ]
    # . . .
  # compile: (tElement, tAttrs, transclude) ->
  #   pre: (scope, iElement, iAttrs, controller) -> ...2
  #   post: (scope, iElement, iAttrs, controller) -> ...

angular.module("Dashboard").directive 'heatmap', [() -> directive]
