BeatArea.Models.Event = Backbone.Model.extend()

BeatArea.Collections.Events = Backbone.Collection.extend
  model: BeatArea.Models.Event
  url: '/events'