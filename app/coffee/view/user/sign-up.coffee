define [
	'view/form',
	'state',
	'router',
	'template/user/sign-up'
], (
	FormView,
	state,
	router,
	template
) ->
	SignUpView = FormView.extend
		el: '#body'

		submit: ->
			state.user.set
				username: @formModel.get 'username'
				password: @formModel.get 'password'
			.save()
				.then ->
					state.user.authenticate().then ->
						router.navigate '/', trigger: true
				.fail ->
					alert 'there was an error creating your user'


		render: ->
			@$el.html template()
			FormView::render.call @
