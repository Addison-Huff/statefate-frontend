define [
	'backbone',
	'model/validation'
], (
	Backbone,
	Validation
) ->
	FormModel = Backbone.Model.extend Validation.mixin