define [
	'model/form'
], (
	FormModel
) ->
	ProtestFormModel = FormModel.extend
		fields:
			description:
				required: true

			mission:
				required: true

			tags:
				required: true

			threshold:
				required: true
				min: 50
				number: true,
				type: Number

			address:
				required: true
