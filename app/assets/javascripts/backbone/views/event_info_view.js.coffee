class BeatArea.Views.EventInfo extends Backbone.View

  initialize: (options) ->
    @model.fetch
      success: =>
        @render()

  render: ->
    @$(".row").html JST['event_info']
      event: @model