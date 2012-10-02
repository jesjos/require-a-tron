class Requirements.Routers.RelationsRouter extends Backbone.Router
  initialize: (options) ->
    @relations = new Requirements.Collections.RelationsCollection()
    @relations.reset options.relations

  routes:
    "new"      : "newRelation"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newRelation: ->
    @view = new Requirements.Views.Relations.NewView(collection: @relations)
    $("#relations").html(@view.render().el)

  index: ->
    @view = new Requirements.Views.Relations.IndexView(relations: @relations)
    $("#relations").html(@view.render().el)

  show: (id) ->
    relation = @relations.get(id)

    @view = new Requirements.Views.Relations.ShowView(model: relation)
    $("#relations").html(@view.render().el)

  edit: (id) ->
    relation = @relations.get(id)

    @view = new Requirements.Views.Relations.EditView(model: relation)
    $("#relations").html(@view.render().el)
