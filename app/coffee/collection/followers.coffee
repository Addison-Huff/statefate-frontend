define [
	'model/user',
	'backbone'
], (
	User,
	Backbone
) ->
	Protests = Backbone.Collection.extend
		model: User
		initialize: (options) ->
			@protest = options.protest
			
		url: ->
			"/api/protest/#{@protest.id}/followers"

		parse: (data) ->
			return data.results