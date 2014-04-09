BeatArea.Models.Event = Backbone.Model.extend
  url: '/events'

BeatArea.Collections.Events = Backbone.Collection.extend
  model: BeatArea.Models.Event
  url: '/events'