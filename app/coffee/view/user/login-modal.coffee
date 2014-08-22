define [
	'view/modal',
	'template/user/login'
], (
	ModalView,
	template
) ->
	LoginModalView = ModalView.extend
		render: ->
			@$el.html template()
