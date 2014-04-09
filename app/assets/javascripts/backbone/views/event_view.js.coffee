class BeatArea.Views.Event extends Backbone.View
  className: 'row'
  tagName: 'article'

  events:
    'click' : 'toggleExpand'
    'click .more-info' : 'moreInfo'

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
      @$('.event-buttons').slideDown()
      @$('.expand').hide()
      @$('.close').fadeIn()

    @expanded = !@expanded

  moreInfo: ->
    router.navigate('events/' + @model.id, {replace: true})
    router.eventInfo()