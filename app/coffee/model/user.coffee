define [
	'backbone'
], (
	Backbone
) ->
	UserModel = Backbone.Model.extend
		urlRoot: '/api/user'

		authenticate: ->
			Backbone.$.ajax
				url: '/api/user/authenticate'
				data: JSON.stringify
					username: @get 'username'
					password: @get 'password'
				type: 'POST'
			.then =>
				@trigger 'login'

		isLoggedIn: ->
			/session/.test document.cookie

		identify: ->
			if @isLoggedIn() and !@identified
				@identified = @fetch
					url: '/api/user'
			else if !@isLoggedIn()
				@identified = Backbone.$.Deferred()
				@identified.reject()

			@identified

		logout: ->
			document.cookie = 'session=; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT'
			@identified = null
			@trigger 'logout'

		join: (protestId) ->
			Backbone.$.ajax
				url: "/api/protest/#{protestId}/join"
				type: 'PUT'
			.then =>
				console.log 'joined'
			.fail =>
				console.log 'cant join'

		leave: (protestId) ->
			Backbone.$.ajax
				url: "/api/protest/#{protestId}/leave"
				type: 'PUT'
			.then =>
				console.log 'left'
			.fail =>
				console.log 'cant leave'

		parse: (data) ->
			data.user
