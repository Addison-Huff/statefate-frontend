define [
	'backbone',
	'state',
	'template/user/sign-up'
], (
	Backbone,
	state,
	template
) ->
	LoginModalView = Backbone.View.extend
		el: '#body'
		events:
			'input input': 'inputInput'
			
		render: ->
			@$el.html template()
