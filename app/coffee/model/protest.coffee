define [
	'collection/followers',
	'backbone'
], (
	Followers,
	Backbone
) ->
	ProtestModel = Backbone.Model.extend
		urlRoot: '/api/protest'
		initialize: (options) ->
			@followers = new Followers protest: @

		getImgSrc: ->
			@get('img') || '/img/protest/default.jpg'

		parse: (data) ->
			data.protest || data