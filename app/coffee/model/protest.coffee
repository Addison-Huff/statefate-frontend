define [
	'collection/followers',
	'model/form'
], (
	Followers,
	FormModel
) ->
	ProtestModel = FormModel.extend
		urlRoot: '/api/protest'
		initialize: (options) ->
			@followers = new Followers protest: @

		getImgSrc: ->
			@get('img') || '/img/protest/default.jpg'

		parse: (data) ->
			data.protest || data