define [
	'model/user',
	'template/user/edit',
	'view/form',
	'view/map',
	'state',
	'jquery'
], (
	UserModel,
	template,
	FormView,
	MapView,
	state,
	$
) ->
	class UserEditView extends FormView
		el: '#body'

		initialize: (options) ->
			@template = options?.template || template
			@user = options?.user || state.user
			@formModel = new UserModel @user.attributes

		events: ->
			$.extend FormView::events, 'input input[name="zip"]': 'renderMap'

		submit: (e) ->
			@formModel.save( validate: true ).then =>
				state.user.set @formModel.attributes

		renderMap: ->
			if @$el.find(@map?.el)?.length == 0
				@map = new MapView
					el: @$el.find '.map .column'
			if @formModel.get('zip')?.length == 5
				@map.setQuery @formModel.get 'zip'
				@map.render()
			else
				if @map.q != 'USA' && @formModel.previous('zip') == null
					@map.setQuery 'USA'
					@map.render()

		render: ->
			@$el.html @template user: @user
			@renderMap()
			super()

