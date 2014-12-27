# directive =
#   template: '<div></div>'
#   restrict: 'E'
#   scope:
#     direction: '='
#     axis:      '='
#     icon:      '='
#   link: (scope, el, attr) ->
#     # itemSelector: el.first
#     el.on 'click', => scope.move(attr.axis, attr.direction)
#   controller: ['$scope', ($scope) ->
#   ]
#     # . . .
#   # compile: (tElement, tAttrs, transclude) ->
#   #   pre: (scope, iElement, iAttrs, controller) -> ...2
#   #   post: (scope, iElement, iAttrs, controller) -> ...

# angular.module("FarmBot").directive 'directionbutton', [() -> directive]
