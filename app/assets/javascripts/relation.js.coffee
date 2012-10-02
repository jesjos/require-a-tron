# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ () =>
	window.collection = collection = new Requirements.Collections.RelationsCollection()
	collection.requirement_id = gon.requirement_id
	collection.fetch()
	window.index = index = new Requirements.Views.Relations.IndexView(el: $("#related_requirements"), relations: collection)
	# index.render()



	