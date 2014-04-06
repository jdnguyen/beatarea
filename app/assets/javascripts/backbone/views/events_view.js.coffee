class BeatArea.Views.Events extends Backbone.View
  el: '#events.container'

  initialize: (options) ->
    @collection = new BeatArea.Collections.Events
    @collection.fetch
      success: =>
        @render()

  render: ->
    @collection.each (event) =>
      @buildEvent(event)

  buildEvent: (event) ->
    eventView = new BeatArea.Views.Event
      model: event
    @$el.append eventView.el