define [
	'backbone',
	'router',
	'template/topnav'
], (
	Backbone,
	router,
	template
) ->
	TopnavView = Backbone.View.extend
		el: '#header'

		initialize: (options) ->
			options ?= {}
			@template = options.template || template

		events:
			'click .protest, .login, .home': 'click'

		click: (e) ->
			e.preventDefault()
			router.navigate e.target.pathname, trigger: true

		render: ->
			@$el.html @template()
