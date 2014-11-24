define [
	'backbone'
], (
	Backbone
) ->
	ProtestModel = Backbone.Model.extend
		urlRoot: '/api/protest'
		getImgSrc: ->
			@get('img') || '/img/protest/default.jpg'
		parse: (data) ->
			data.protest || data