define [
	'backbone',
	'view/topnav',
	'view/footer',
	'router'
], (
	Backbone,
	TopnavView,
	FooterView,
	router
) ->
	IndexView = Backbone.View.extend
		el: '#foreground'
		initialize: (options) ->
			options ?= {}
			@topnav = new TopnavView
			@footer = new FooterView

		events:
			'click a': 'click'

		click: (e) ->
			e.preventDefault()
			router.navigate e.target.pathname, trigger: true

		render: ->
			@topnav.render()
			@footer.render()
