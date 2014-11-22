define [
	'view/form',
	'model/protest',
	'jquery',
	'state',
	'router',
	'template/protest/create'
], (
	FormView,
	ProtestModel,
	$,
	state,
	router,
	template
) ->
	SignUpView = FormView.extend
		el: '#body'

		submit: (e) ->
			@protest ?= new ProtestModel(@formModel.attributes)
			@protest.save()

		render: ->
			$('body').removeClass().addClass('create-protest')
			@$el.html template @formModel.attributes
			FormView::render.call @
