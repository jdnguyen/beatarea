class BeatArea.Views.EventInfo extends Backbone.View
  className: 'row'
  tagName: 'article'

  initialize: (options) ->
    @model.fetch
      success: =>
        @render()

  render: ->
    @$el.html JST['event_info']
      event: @model