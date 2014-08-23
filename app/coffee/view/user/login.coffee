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
			@$el.html template()
