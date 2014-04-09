BeatArea.Models.Event = Backbone.Model.extend
  urlRoot: '/events'

BeatArea.Collections.Events = Backbone.Collection.extend
  model: BeatArea.Models.Event
  url: '/events'