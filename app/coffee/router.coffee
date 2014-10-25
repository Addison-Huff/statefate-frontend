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
			'protest/create': 'createProtest'
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
			if state.user.isLoggedIn()
				@navigate '/user/account', trigger: true
			else
				require ['view/user/login'], (LoginView) =>
					@loginView ?= new LoginView
					@loginView.render()

		logout: ->
			state.user.logout()
			@navigate '/', trigger: true

		createProtest: ->
			require ['view/protest/create', 'model/protest-form'], (CreateProtestView, ProtestFormModel) =>
				@createProtestView ?= new CreateProtestView
					formModel: new ProtestFormModel
				@createProtestView.render()
				
		'sign-up': ->
			require ['view/user/sign-up', 'model/sign-up'], (SignUpView, SignUpModel) =>
				@signUpView ?= new SignUpView
					formModel: new SignUpModel

				@signUpView.render()

	return new Router
