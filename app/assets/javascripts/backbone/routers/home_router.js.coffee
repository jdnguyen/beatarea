class BeatArea.Routers.Home extends Backbone.Router
  initialize: (options) ->
    @speed = 300
    @mainView = new BeatArea.Views.Main

    Backbone.history.start() unless Backbone.History.started
    $(document).on "page:change", ->
      Backbone.history.stop()
      Backbone.history.start()

  routes:
    "events/:id": "eventInfo"
    "": "index"

  index: ->
    $("#event-more-info").hide "slide",
      direction: "right"
    , @speed, ->
      $("#events").show "slide",
        direction: "left"
      , @speed

    $(".back-page").hide()

    @eventsView = new BeatArea.Views.Events if !@eventsView

  eventInfo: (id) ->
    $("#events").hide "slide",
      direction: "left"
    , @speed, ->
      $("#event-more-info").show "slide",
        direction: "right"
      , @speed

    $(".back-page").fadeIn()

    event = new BeatArea.Models.Event
      id: id

    @eventInfoView = new BeatArea.Views.EventInfo
      el: "#event-more-info"
      model: event
