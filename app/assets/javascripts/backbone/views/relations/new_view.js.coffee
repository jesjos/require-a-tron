Requirements.Views.Relations ||= {}

class Requirements.Views.Relations.NewView extends Backbone.View
  template: JST["backbone/templates/relations/new"]

  events:
    "submit #new-relation": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (relation) =>
        @model = relation
        window.location.hash = "/#{@model.id}"

      error: (relation, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
