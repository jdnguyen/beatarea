class BeatArea.Routers.Home extends Backbone.Router
  initialize: (options) ->

  routes:
    "": "index"

  index: ->
    @eventsView = new BeatArea.Views.Events

