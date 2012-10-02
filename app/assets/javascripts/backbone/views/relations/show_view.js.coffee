Requirements.Views.Relations ||= {}

class Requirements.Views.Relations.ShowView extends Backbone.View
  template: JST["backbone/templates/relations/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
