define [
	'model/protest'
], (
	ProtestModel
) ->
	ProtestFormModel = ProtestModel.extend
		defaults: 
			threshold: 50
			goal: ''
			title: ''
			background: ''
			tags: ''
			state: ''
			city: ''
			zip: ''
			country: 'US'
			street: '',
			furtherReading: []

		fields:
			background:
				required: true

			goal:
				required: true

			title:
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
