define [
	'backbone',
	'router',
	'template/topnav'
], (
	Backbone,
	router,
	template
) ->
	TopnavView = Backbone.View.extend
		el: '#header'

		initialize: (options) ->
			options ?= {}
			@template = options.template || template

		events:
			'click .protest': 'clickProtest'
			'click .login': 'clickLogin'

		clickProtest: (e) ->
			e.preventDefault()
			router.navigate e.target.pathname

		clickLogin: (e) ->
			e.preventDefault()
			require ['view/user/login-modal'], (LoginModalView) =>
				@loginView = @loginView || new LoginModalView()
				@loginView.render()
				@loginView.open()

		render: ->
			@$el.html @template()
