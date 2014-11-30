define [
	'view/base',
	'template/404'
], (
	BaseView,
	template
) ->
	TopnavView = BaseView.extend
		el: '#body'

		render: ->
			@$el.html template()
