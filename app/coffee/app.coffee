define [
	'backbone',
	'router'
], (
	Backbone,
	router
) ->
	app =
		main: ->
			$(document).foundation()
			router.on 'route:change', (path) ->

				require ['view/index'], (View) ->
					v = new View()
					v.render()

			Backbone.history.start pushState: true
