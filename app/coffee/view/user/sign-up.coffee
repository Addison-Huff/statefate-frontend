define [
	'backbone',
	'template/user/sign-up'
], (
	Backbone,
	template
) ->
	LoginModalView = Backbone.View.extend
		el: '#body'
		render: ->
			@$el.html template()
