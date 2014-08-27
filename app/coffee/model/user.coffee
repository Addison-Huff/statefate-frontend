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

			return @identified

		logout: ->
			document.cookie = 'session=; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT'
			@identified = null
			@trigger 'logout'

		parse: (data) ->
			return data.user
