Requirements.Views.Relations ||= {}

class Requirements.Views.Relations.IndexView extends Backbone.View
  template: JST["backbone/templates/relations/index"]

  initialize: () ->
    @options.relations.bind('reset', @addAll)

  addAll: () =>
    @options.relations.each(@addOne)

  addOne: (relation) =>
    view = new Requirements.Views.Relations.RelationView({model : relation})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(relations: @options.relations.toJSON() ))
    @addAll()

    return this
