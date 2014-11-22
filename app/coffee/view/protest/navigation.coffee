define [
	'backbone',
	'template/protest/navigation'
], (
	Backbone,
	template
) ->
	ProtestNavigation = Backbone.View.extend
		el: '.protest-navigation'
		render: ->
			@el.html template()