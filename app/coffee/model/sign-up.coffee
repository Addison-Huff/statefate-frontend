define [
	'model/form'
], (
	FormModel
) ->
	SignUpModel = FormModel.extend

		fields:
			password:
				required: true

			username:
				required: true

			confirmPassword:
				confirm: 'password'
				required: true

			confirmUsername:
				required: true
				confirm: 'username'
