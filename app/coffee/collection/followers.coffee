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
			console.log 'sup'
			"/api/protest/#{@protest.id}/followers"

		parse: (data) ->
			return data.results