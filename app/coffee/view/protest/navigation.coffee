define [
	'view/base',
	'template/protest/navigation'
], (
	BaseView,
	template
) ->
	ProtestNavigation = BaseView.extend
		el: '.protest-navigation'
		render: ->
			@el.html template()