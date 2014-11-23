define [
	'view/base',
	'template/footer'
], (
	BaseView,
	template
) ->
	IndexView = BaseView.extend
		el: '#footer'
		render: ->
			@$el.html template(year: (new Date()).getFullYear())
