define [
	'view/base',
	'template/protest/followers'
], (
	BaseView,
	template
) ->
	ProtestFollowersView = BaseView.extend
		el: '.followers'
		initialize: (options) ->
			@protest = options?.protest
			@template = options?.template || template
			
		render: ->
			@protest.followers.fetch()
				.then => @$el.html @template
					followers: @protest.followers
					total: @protest.followers.length