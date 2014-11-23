define [
	'backbone'
], (
	Backbone
) ->
	BaseView = Backbone.View.extend
		stop: ->
			@stopListening()
			@undelegateEvents()
