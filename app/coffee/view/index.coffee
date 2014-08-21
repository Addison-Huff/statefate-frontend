define [
	'backbone',
	'view/topnav'
], (
	Backbone,
	TopnavView
) ->
	IndexView = Backbone.View.extend
		el: 'body'
		initialize: (options) ->
			options ?= {}
			@topnav = new TopnavView

		render: ->
			@topnav.render()
