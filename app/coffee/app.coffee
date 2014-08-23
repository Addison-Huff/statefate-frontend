define [
	'backbone',
	'router',
	'view/index'
], (
	Backbone,
	router,
	IndexView
) ->
	app =
		main: ->
			$(document).foundation()
			
			view = new IndexView
			view.render()

			Backbone.history.start pushState: true
