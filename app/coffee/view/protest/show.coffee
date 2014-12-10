define [
	'view/base',
	'view/protest/followers',
	'template/protest/show',
	'router',
	'state'
], (
	BaseView,
	FollowersView,
	template,
	router,
	state
) ->
	ProtestView = BaseView.extend
		el: '#body'
		initialize: (options) ->
			@protest = options?.protest
			@isJoined = options?.isJoined
			@template = options?.template || template

		events: 
			'click button.join': 'clickJoin'

		clickJoin: (e) ->
			state.user.join @protest.get 'id'
				.then =>
					@render()
				.fail ->
					router.navigate '/user/login', trigger: true

		render: ->
			if @$el.is '#body'
				Backbone.$('body').removeClass().addClass 'protest-show'

			@$el
				.addClass 'protest'
				.html @template(protest: @protest, isJoined: @isJoined)

			if @$el.find '.followers'
				@followers = new FollowersView protest: @protest
				@followers.render()