define [
	'backbone',
	'template/user/login'
], (
	Backbone,
	template
) ->
	LoginModalView = Backbone.View.extend
		el: '#body'
		render: ->
			console.log 'rendering view', template(), @el
			@$el.html template()
