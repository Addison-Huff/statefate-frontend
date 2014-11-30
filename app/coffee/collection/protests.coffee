define [
	'model/protest',
	'backbone'
], (
	Protest,
	Backbone
) ->
	Protests = Backbone.Collection.extend
		model: Protest
		url: '/api/protest/search'

		search: (lucene) ->
			return @fetch data: q: lucene

		parse: (data) ->
			return data.results