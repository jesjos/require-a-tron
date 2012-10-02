Requirements.Views.Relations ||= {}

class Requirements.Views.Relations.RelationView extends Backbone.View
  template: JST["backbone/templates/relations/relation"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
