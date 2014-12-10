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
				confirmPassword:
					confirm: 'password'
					required: true
			)()