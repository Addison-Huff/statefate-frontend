define [
	'underscore'
], (
	_
) ->
	String::capitalize = ->
		return @charAt(0).toUpperCase() + @substr(1)
	String::camelToSpace = ->
		return this.replace /([A-Z])/g, ' $1'

	Validation =
		methods:
			number: (val, field, arg) ->
				Validation.methods.pattern val, field, /^\d+$/
			pattern: (val, field, arg) ->
				typeof val != undefined and arg.test (val || '').toString()
			required: (val, field, arg) ->
				Validation.methods.pattern val, field, /[^\s]/
			date: (val, field, arg) ->
				Validation.methods.pattern val, field, /^\d+-\d{2}-\d{2}$/
			confirm: (val, field, otherField) ->
				@get(otherField) == val
			min: (val, field, min) ->
				min <= val
			type: (val, field, Type) ->
				if val != ''
					@.set field, (new Type(val)).valueOf()


		messages:
			required: (field) -> "#{field} is required"
			number: (field) -> "#{field} must be a number"
			pattern: (field) -> "#{field} must be a valid format"
			date: (field) -> "#{field} must be YYYY-MM-DD"
			confirm: (field) -> "#{field} does not match"
			min: (field, arg) -> "#{field} must be at least #{arg}"

		mixin:
			validate: (attrs) ->
				messages = for field, methods of @fields
					fieldMessages = for method, arg of methods
						validationMethod = Validation.methods[method]
						if validationMethod && !validationMethod.call @, attrs[field], field, arg
							Validation.messages[method] field.camelToSpace().capitalize(), arg
					fieldMessages = (message for message in fieldMessages when message)
					if fieldMessages.length > 0
						fieldMessage = {}
						fieldMessage.field = field
						fieldMessage.messages = fieldMessages
						fieldMessage

				messages = (message for message in messages when message)

				if messages.length
					_.flatten messages
