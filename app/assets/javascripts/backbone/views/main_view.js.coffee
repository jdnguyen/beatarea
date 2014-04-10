class BeatArea.Views.Main extends Backbone.View
  el: "body"

  events:
    'click .back-page' : 'backToIndex'

  initialize: (options) ->

  backToIndex: ->
    $(".sound-cloud-wrap").remove()
    router.index()