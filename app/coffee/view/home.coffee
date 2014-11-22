define [
	'view/protest/list',
	'backbone',
	'template/home'
], (
	ProtestList,
	Backbone,
	template
) ->
	IndexView = Backbone.View.extend
		el: '#body'
		initialize: (options) ->
			@protestListView = new ProtestList( collection: @collection )
			@listenTo @collection, 'sync', =>
				console.log('syning!');
				@protestListView.render()

		render: ->
			Backbone.$('body').removeClass().addClass 'home'
			@collection.search '*:*'
			@$el.html template()
			@protestListView.setElement @$el.find '.protest-list'
