define [
	'backbone'
], (
	Backbone
) ->
	Router = Backbone.Router.extend
		routes:
			'': 'index'
			'user/login': 'login'
			'*path': '404'

		log: console.log.bind console, '[Router]'

		404: ->
			require ['view/404'], (NotFoundView) =>
				@fourOhFourView ?= new NotFoundView
				@fourOhFourView.render()

		index: ->
			require ['view/home'], (HomeView) =>
				@homeView ?= new HomeView
				@homeView.render()
				
		login: ->
			require ['view/user/login'], (LoginView) =>
				@loginView ?= new LoginView
				@loginView.render()

	return new Router
