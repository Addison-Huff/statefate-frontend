define [
	'backbone',
	'template/shared/topnav'
], (
	Backbone,
	template
) ->
	IndexView = Backbone.View.extend
		el: 'body'
		initialize: (options) ->
			options ?= {}
			@template = options.template || template

		render: ->
			@$el.html @template()
