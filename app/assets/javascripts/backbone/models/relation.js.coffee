class Requirements.Models.Relation extends Backbone.Model
  paramRoot: 'relation'

  defaults: null

class Requirements.Collections.RelationsCollection extends Backbone.Collection
  model: Requirements.Models.Relation
  url: () =>
  	return "/requirements/" + @requirement_id + "/relations.json"
