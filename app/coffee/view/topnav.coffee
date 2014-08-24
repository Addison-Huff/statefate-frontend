define [
	'backbone',
	'template/topnav'
], (
	Backbone,
	template
) ->
	TopnavView = Backbone.View.extend
		el: '#header'

		render: ->
			@$el.html template()
