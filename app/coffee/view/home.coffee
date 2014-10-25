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
			Backbone.$('body').removeClass().addClass 'home'
			@$el.html template()