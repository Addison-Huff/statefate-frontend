define [
	'model/sign-up',
	'view/form',
	'jquery',
	'state',
	'router',
	'template/user/sign-up'
], (
	SignUpFormModel,
	FormView,
	$,
	state,
	router,
	template
) ->
	class SignUpView extends FormView
		el: '#body'

		initialize: (options) ->
			options ?= {}
			options.formModel ?= new SignUpFormModel
			super(options)

		submit: ->
			deferred = state.user.set
				username: @formModel.get 'username'
				password: @formModel.get 'password'
			.save()

			if deferred
				deferred.then ->
					state.user.authenticate().then ->
						router.navigate '/', trigger: true
				.fail ->
					alert 'there was an error creating your user'


		render: ->
			$('body').removeClass().addClass('sign-up')
			@$el.html template()
			FormView::render.call @
