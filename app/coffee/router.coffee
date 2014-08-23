define [
	'backbone'
], (
	Backbone
) ->
	Router = Backbone.Router.extend
		routes:
			'user/login': 'login'
			'*path': 'change'

		log: console.log.bind console, '[Router]'

		change: (path) ->
			@log(path)

		'login': (yea) ->
			require ['view/user/login'], (LoginView) =>
				@view ?= new LoginView
				@view.render()

	return new Router
