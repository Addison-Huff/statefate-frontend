define [
	'backbone'
], (
	Backbone
) ->
	BaseView = Backbone.View.extend
		stop: ->
			@stopListening()
			@undelegateEvents()

		_message: (message, type, timeout) ->
			alertBox = $ "<div data-alert class=\"#{type} alert-box base-alert\" />"
			alertBox.text message
			$('body').append alertBox

			setTimeout ->
				alertBox.remove()
			, timeout || 5000

		success: (message, timeout) ->
			@_message message, 'success', timeout

		alert: (message, timeout) ->
			@_message message, 'alert', timeout

		clearMessage: ->
			$('div.base-alert').remove()
