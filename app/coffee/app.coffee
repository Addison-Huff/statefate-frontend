define [
	'backbone',
	'router',
	'state',
	'model/user',
	'view/index'
], (
	Backbone,
	router,
	state,
	UserModel,
	IndexView
) ->
	app =
		main: ->
			$(document).foundation()
			
			state.user = new UserModel
			state.user.identify()

			state.page = new IndexView
			state.page.render()

			Backbone.history.start pushState: true
