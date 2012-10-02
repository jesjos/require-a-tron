# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ =>
	create = (related) ->
		model = new Models.Relation(related)
		view = new Views.Relation(model: model)
	create related for related in gon.related_requirements if gon.related_requirements?
