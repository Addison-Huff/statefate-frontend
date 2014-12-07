define [
	'view/protest/show',
	'view/base',
	'template/protest/listing',
	'underscore'
], (
	ProtestView,
	BaseView,
	listingTemplate,
	_
) ->
	ProtestListView = BaseView.extend
		el: '.protest-list'

		render: ->
			@$el.html ''
			@$el.html listingTemplate(protests: @collection)