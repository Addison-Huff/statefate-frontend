define [
	'backbone'
], (
	Backbone
) ->
	JoinModel = Backbone.Model.extend
		url: ->
			"/api/join/#{ @get 'protest_id' }"

		parse: (data) ->
			data.join || data