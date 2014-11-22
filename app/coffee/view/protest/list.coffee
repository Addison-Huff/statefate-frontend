define [
	'view/protest/show',
	'backbone',
	'underscore'
], (
	ProtestView,
	Backbone,
	_
) ->
	ProtestListView = Backbone.View.extend
		el: '.protest-list'

		append: (view) ->
			@$el.append view.el
			_.defer -> view.render()

		render: ->
			@$el.html ''
			@collection.each (protest) =>
				@append new ProtestView( protest: protest )