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
			'user/sign-up': 'signUp'
			'protest/create': 'createProtest'
			'protest/:id': 'showProtest'
			'*path': '404'

		log: console.log.bind console, '[Router]'

		404: ->
			@currentView?.stop()
			require ['view/404'], (NotFoundView) =>
				@currentView = new NotFoundView
				@currentView.render()

		index: ->
			@currentView?.stop()
			require ['view/home', 'collection/protests'], (HomeView, Protests) =>
				@protests = new Protests
				@currentView = new HomeView(collection: @protests)
				@currentView.render()

		login: ->
			@currentView?.stop()
			if state.user.isLoggedIn()
				@navigate '/user/account', trigger: true
			else
				require ['view/user/login'], (LoginView) =>
					@currentView = new LoginView
					@currentView.render()

		logout: ->
			@currentView?.stop()
			state.user.logout()
			@navigate '/', trigger: true

		createProtest: ->
			if not state.user.isLoggedIn()
				@navigate '/user/login', trigger: true
			else
				@currentView?.stop()
				require ['view/protest/create', 'model/protest-form'], (CreateProtestView, ProtestFormModel) =>
					@currentView = new CreateProtestView
						formModel: new ProtestFormModel
					@currentView.render()
				
		showProtest: (id) ->
			@currentView?.stop()
			require ['view/protest/show', 'model/protest'], (ShowProtestView, ProtestModel) =>
				protest = new ProtestModel(id: id)
				Backbone.$.when(protest.fetch(), state.user.isJoined(id)).always (_, isJoined) =>
					@currentView = new ShowProtestView
						protest: protest
						isJoined: isJoined

					@currentView.render()

		signUp: ->
			@currentView?.stop()
			require ['view/user/sign-up', 'model/sign-up'], (SignUpView, SignUpModel) =>
				@currentView = new SignUpView
					formModel: new SignUpModel

				@currentView.render()

	return new Router
