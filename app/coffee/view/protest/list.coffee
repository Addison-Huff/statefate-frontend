define [
	'view/protest/show',
	'view/base',
	'underscore'
], (
	ProtestView,
	BaseView,
	_
) ->
	ProtestListView = BaseView.extend
		el: '.protest-list'

		append: (view) ->
			@$el.append view.el
			_.defer -> view.render()

		render: ->
			@$el.html ''
			@collection.each (protest) =>
				@append new ProtestView( protest: protest )