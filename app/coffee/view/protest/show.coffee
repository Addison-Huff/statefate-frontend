define [
	'view/base',
	'template/protest/show'
], (
	BaseView,
	template
) ->
	ProtestView = BaseView.extend
		initialize: (options) ->
			@protest = options?.protest

		render: ->
			@$el
				.addClass 'protest'
				.html template protest: @protest