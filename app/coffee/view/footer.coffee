define [
	'backbone',
	'template/footer'
], (
	Backbone,
	template
) ->
	IndexView = Backbone.View.extend
		el: '#footer'
		render: ->
			@$el.html template(year: (new Date()).getFullYear())
