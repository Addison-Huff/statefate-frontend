define [
	'model/form'
], (
	FormModel
) ->
	ProtestFormModel = FormModel.extend
		defaults: 
			threshold: 50
			mission: ''
			description: ''
			tags: ''
			state: ''
			city: ''
			zip: ''
			country: 'US'
			street: ''

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

			state:
				required: true

			city:
				required: true

			zip:
				required: true
				
			street:
				required: true
