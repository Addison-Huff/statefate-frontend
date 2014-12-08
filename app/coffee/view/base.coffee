define [
	'backbone'
], (
	Backbone
) ->
	BaseView = Backbone.View.extend
		stop: ->
			@stopListening()
			@undelegateEvents()

		alert: (message, timeout) ->
			alertBox = $ '<div data-alert class="success alert-box" />'
			alertBox.text message
			$('body').append alertBox

			setTimeout ->
				alertBox.remove()
			, timeout || 5000
