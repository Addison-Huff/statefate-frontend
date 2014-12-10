define [
	'view/base',
	'template/user/login',
	'state',
	'router',
	'backbone'
], (
	BaseView
	template,
	state,
	router,
	Backbone
) ->
	LoginModalView = BaseView.extend
		el: '#body'
		events:
			'click .login-btn': 'clickLogin'

		clickLogin: (e) ->
			e.preventDefault()

			state.user.set
				username: @$el.find('.username input').val()
				password: @$el.find('.password input').val()

			state.user.authenticate()
				.then ->
					router.navigate '/', trigger: true
				.fail (res) =>
					@alert res.responseJSON.message

		render: ->
			Backbone.$('body').removeClass().addClass('login')
			@$el.html template()
