define [
	'backbone',
	'template/404'
], (
	Backbone,
	template
) ->
	TopnavView = Backbone.View.extend
		el: '#body'

		render: ->
			@$el.html template()
