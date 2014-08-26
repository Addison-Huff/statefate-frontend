define [
	'backbone'
], (
	Backbone
) ->
	ProtestModel = Backbone.Model.extend
		urlRoot: '/api/protest'
