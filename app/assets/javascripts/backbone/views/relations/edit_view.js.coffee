Requirements.Views.Relations ||= {}

class Requirements.Views.Relations.EditView extends Backbone.View
  template : JST["backbone/templates/relations/edit"]

  events :
    "submit #edit-relation" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (relation) =>
        @model = relation
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
