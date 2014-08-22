define [
	'backbone'
], (
	Backbone
) ->
	ModalView = Backbone.View.extend
		initialize: (options) ->
			options ?= {}
			@id = options.id || Math.random().toString().replace '.', ''
			this.$el
				.attr 'id', "modal-#{@id}"
				.addClass 'reveal-modal'
				.attr 'data-reveal', ''

			document.body.appendChild this.el

		open: ->
			@$el.foundation 'reveal', 'open'

		close: ->
			@$el.foundation 'reveal', 'close'
