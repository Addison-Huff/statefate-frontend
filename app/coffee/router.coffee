define [
	'backbone',
	'state'
], (
	Backbone,
	state
) ->
	Router = Backbone.Router.extend
		routes:
			'': 'index'
			'user/logout': 'logout'
			'user/login': 'login'
			'user/sign-up': 'sign-up'
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

		logout: ->
			state.user.logout()
			this.navigate '/', trigger: true

		'sign-up': ->
			require ['view/user/sign-up'], (SignUpView) =>
				@signUpView ?= new SignUpView
				@signUpView.render()

	return new Router
