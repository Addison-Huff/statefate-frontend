define [
	'backbone',
	'view/topnav',
	'view/footer'
], (
	Backbone,
	TopnavView,
	FooterView
) ->
	IndexView = Backbone.View.extend
		el: '#foreground'
		initialize: (options) ->
			options ?= {}
			@topnav = new TopnavView
			@footer = new FooterView

		render: ->
			@topnav.render()
			@footer.render()
