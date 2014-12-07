define [
	'view/protest/list',
	'view/base',
	'template/home',
	'backbone'
], (
	ProtestList,
	BaseView,
	template,
	Backbone
) ->
	IndexView = BaseView.extend
		el: '#body'
		initialize: (options) ->
			@protestListView = new ProtestList( collection: @collection )
			@listenTo @collection, 'sync', =>
				@protestListView.render()

		render: ->
			Backbone.$('body').removeClass().addClass 'home'
			@$el.html template()
			@protestListView.setElement @$el.find '.protest-list'
			@collection.search '*:*'
