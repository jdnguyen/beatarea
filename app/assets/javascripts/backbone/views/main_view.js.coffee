class BeatArea.Views.Main extends Backbone.View
  el: "body"

  events:
    'click .back-page' : 'backToIndex'

  initialize: (options) ->

  backToIndex: ->
    router.navigate('', {replace: true})
    router.index()