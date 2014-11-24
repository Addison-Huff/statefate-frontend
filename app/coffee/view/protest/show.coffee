define [
	'view/base',
	'template/protest/show'
], (
	BaseView,
	template
) ->
	ProtestView = BaseView.extend
		el: '#body'
		initialize: (options) ->
			@protest = options?.protest
			@template = options?.template || template
			
		render: ->
			if @$el.is '#body'
				Backbone.$('body').removeClass().addClass 'protest-show'

			@$el
				.addClass 'protest'
				.html @template(protest: @protest)