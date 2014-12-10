define [
	'backbone'
], (
	Backbone
) ->
	class MapView extends Backbone.View
		key: "AIzaSyC227nBhr435UfW6cEweKrFbrYRdAzAq00"

		setQuery: (q) ->
			@q = q

		getSrc: ->
			"https://www.google.com/maps/embed/v1/place?key=#{@key}&q=#{@q}"

		render: ->
			@$el.html "<iframe src=\"#{@getSrc()}\" />"