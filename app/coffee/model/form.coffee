define [
	'backbone',
	'model/validation'
], (
	Backbone,
	Validation
) ->
	Backbone.Model.extend Validation.mixin
