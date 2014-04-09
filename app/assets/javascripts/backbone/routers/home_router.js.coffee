class BeatArea.Routers.Home extends Backbone.Router
  initialize: (options) ->
    @mainView = new BeatArea.Views.Main

  routes:
    "events/:id": "eventInfo"
    "": "index"

  index: ->
    $("#events").show "slide",
      direction: "left"
    , 500

    $(".back-page").hide()

    @eventsView = new BeatArea.Views.Events if !@eventsView

  eventInfo: (id) ->
    $("#events").hide "slide",
      direction: "left"
    , 500

    $(".back-page").fadeIn()

    event = new BeatArea.Models.Event
      id: id
    @eventInfoView = new BeatArea.Views.EventInfo
      model: event
