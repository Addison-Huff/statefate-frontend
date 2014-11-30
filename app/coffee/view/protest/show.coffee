define [
	'view/base',
	'view/protest/followers',
	'template/protest/show',
	'state'
], (
	BaseView,
	FollowersView,
	template,
	state
) ->
	ProtestView = BaseView.extend
		el: '#body'
		initialize: (options) ->
			@protest = options?.protest
			@template = options?.template || template

		events: 
			'click button.join': 'clickJoin'

		clickJoin: (e) ->
			state.user.join @protest.get 'id'

		render: ->
			if @$el.is '#body'
				Backbone.$('body').removeClass().addClass 'protest-show'

			@$el
				.addClass 'protest'
				.html @template(protest: @protest)

			if @$el.find '.followers'
				@followers = new FollowersView protest: @protest
				@followers.render()