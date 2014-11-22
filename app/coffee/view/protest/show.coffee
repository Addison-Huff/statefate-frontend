define [
	'backbone',
	'template/protest/show'
], (
	Backbone,
	template
) ->
	ProtestView = Backbone.View.extend
		initialize: (options) ->
			@protest = options?.protest

		render: ->
			@$el
				.addClass 'protest'
				.html template protest: @protest