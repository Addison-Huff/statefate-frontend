define [
	'view/base',
	'view/topnav',
	'view/footer',
	'router'
], (
	BaseView,
	TopnavView,
	FooterView,
	router
) ->
	IndexView = BaseView.extend
		el: 'body'
		initialize: (options) ->
			options ?= {}
			@topnav = new TopnavView
			@footer = new FooterView

		events:
			'click a': 'click'

		click: (e) ->
			e.preventDefault()
			router.navigate e.target.pathname, trigger: true
			scrollTo 0, 0

		render: ->
			@topnav.render()
			@footer.render()
