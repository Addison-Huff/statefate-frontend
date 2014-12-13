define [
	'model/user',
	'jquery'
], (
	UserModel,
	$
) ->
	class SignUpModel extends UserModel

		fields: ( ->
			$.extend {}, UserModel::fields,
				password:
					required: true
					minLength: 6
					
				confirmPassword:
					confirm: 'password'
					required: true
			)()