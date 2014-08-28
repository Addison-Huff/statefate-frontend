define [
	'view/form',
	'state',
	'template/user/sign-up'
], (
	FormView,
	state,
	template
) ->
	SignUpView = FormView.extend
		el: '#body'

		render: ->
			@$el.html template()
			FormView::render.call @
