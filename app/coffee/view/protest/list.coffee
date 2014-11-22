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
			view.render()
			console.log(view.el)
			@$el.append view.el
			_.defer -> view.render()

		render: ->
			@$el.html ''
			view = new ProtestView( protest: {} )
			@collection.each (protest) =>
				view = new ProtestView( protest: protest )
				@append(view)