class BeatArea.Views.Event extends Backbone.View
  className: 'row'
  tagName: 'article'

  events:
    'click' : 'toggleExpand'

  initialize: (options) ->
    @expanded = false
    @render()

  render: ->
    @$el.html JST['event']
      event: @model

  toggleExpand: (e) ->
    if @$(e.target).hasClass('btn')
      return
    if @expanded
      @$('.close').hide()
      @$('.expand').fadeIn()
      @$('.event-buttons').slideUp()
    else
      if @$('.event-buttons').is(':empty')
        @model.fetch
          success: =>
            @$('.event-buttons').html JST['event_info']
              event: @model
            @$('.event-buttons').slideDown()
      else
        @$('.event-buttons').slideDown()
      @$('.expand').hide()
      @$('.close').fadeIn()

    @expanded = !@expanded

