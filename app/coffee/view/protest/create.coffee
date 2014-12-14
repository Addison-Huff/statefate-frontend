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
				.then (res) ->
					id = res.protest.id
					router.navigate '/protest/' + id, trigger: true
				.fail ->
					# show some error

		render: ->
			$('body').removeClass().addClass('create-protest')
			render = =>
				@$el.html template @formModel.attributes
			if not @formModel.isNew()
				@formModel.fetch().then render
			render()
			FormView::render.call @