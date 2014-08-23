define [
	'backbone',
	'template/home'
], (
	Backbone,
	template
) ->
	IndexView = Backbone.View.extend
		el: '#body'
		render: ->
			@$el.html template()
