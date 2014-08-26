define [
	'backbone',
	'template/topnav',
	'state'
], (
	Backbone,
	template,
	state
) ->
	TopnavView = Backbone.View.extend
		el: '#header'
		initialize: ->
			@listenTo state.user, 'logout login', @render

		render: ->
			console.log 'calling render'
			state.user.identify()
				.always =>
					console.log 'rendering with', state.user
					@$el.html template(user: state.user)
