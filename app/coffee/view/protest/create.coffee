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

	CreateProtestView = FormView.extend
		el: '#body'

		submit: (e) ->
			@protest = new ProtestModel(@formModel.attributes)
			@protest.save()
				.then (protest) ->
					router.navigate '/protest/' + protest.id, trigger: true
				.fail ->
					# show some error

		render: ->
			$('body').removeClass().addClass('create-protest')
			@$el.html template @formModel.attributes
			FormView::render.call @