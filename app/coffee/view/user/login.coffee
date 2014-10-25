define [
	'backbone',
	'template/user/login',
	'state',
	'router'
], (
	Backbone,
	template,
	state,
	router
) ->
	LoginModalView = Backbone.View.extend
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
				.fail (e) ->
					res = JSON.parse e.responseText
					console.log res.message

		render: ->
			Backbone.$('body').removeClass().addClass('login')
			@$el.html template()
