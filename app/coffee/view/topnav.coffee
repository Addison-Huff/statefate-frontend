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
			state.user.identify()
				.always =>
					@$el.html template(user: state.user)
