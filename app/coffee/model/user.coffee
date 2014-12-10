define [
	'model/form',
	'model/join',
	'jquery'
], (
	FormModel,
	Join,
	$
) ->
	class UserModel extends FormModel
		urlRoot: '/api/user'

		fields:
			username:
				required: true
				minLength: 3
				pattern: [ /^\w+$/, 'Username cannot have spaces' ]

			email:
				required: true
				pattern: /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/

			password:
				required: true
				minLength: 6

		authenticate: ->
			$.ajax
				url: '/api/user/authenticate'
				data: JSON.stringify
					username: @get 'username'
					password: @get 'password'
				type: 'POST'
			.then =>
				@trigger 'authenticated'

		isLoggedIn: ->
			/session/.test document.cookie

		identify: ->
			if @isLoggedIn() and !@identified
				@identified = @fetch
					url: '/api/user'
			else if !@isLoggedIn()
				@identified = $.Deferred()
				@identified.reject()

			@identified

		logout: ->
			document.cookie = 'session=; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT'
			@identified = null
			@clear()
			@trigger 'logout'

		join: (protestId) ->
			$.ajax
				url: "/api/protest/#{protestId}/join"
				type: 'PUT'
			.then =>
				console.log 'joined'
			.fail =>
				console.log 'cant join'

		isJoined: (protestId) ->
			deferred = $.Deferred()
			if @isLoggedIn()
				join = new Join protest_id: protestId
				join.fetch()
					.then -> deferred.resolve true
					.fail -> deferred.resolve false
			else
				deferred.resolve false
			deferred

		leave: (protestId) ->
			$.ajax
				url: "/api/protest/#{protestId}/leave"
				type: 'PUT'
			.then =>
				console.log 'left'
			.fail =>
				console.log 'cant leave'

		parse: (data) ->
			data.user || data
