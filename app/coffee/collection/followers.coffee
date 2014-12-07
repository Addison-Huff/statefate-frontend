define [
	'model/user',
	'backbone'
], (
	User,
	Backbone
) ->
	Followers = Backbone.Collection.extend
		model: User
		initialize: (options) ->
			@protest = options.protest
			
		url: ->
			"/api/protest/#{@protest.id}/followers"

		parse: (data) ->
			return data.results