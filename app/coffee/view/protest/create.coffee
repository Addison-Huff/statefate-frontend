define [
	'view/form',
	'state',
	'router',
	'template/protest/create'
], (
	FormView,
	state,
	router,
	template
) ->
	SignUpView = FormView.extend
		el: '#body'

		submit: (e) ->
			alert 'not implemented'

		render: ->
			@$el.html template()
			FormView::render.call @
