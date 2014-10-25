define [
	'backbone',
	'template/protest/show'
], (
	Backbone,
	template
) ->
	IndexView = Backbone.View.extend
		el: '.protest'
		initialize: (options) ->
			@protest = options?.protest

		render: ->
			@$el.html template protest: @protest