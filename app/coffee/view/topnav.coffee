define [
	'view/base',
	'template/topnav',
	'state'
], (
	BaseView,
	template,
	state
) ->
	TopnavView = BaseView.extend
		el: '#header'
		initialize: ->
			@listenTo state.user, 'logout login', @render

		render: ->
			state.user.identify()
				.always =>
					@$el.html template(user: state.user)
