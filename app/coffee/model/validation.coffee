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
			number: (val, arg) ->
				Validation.methods.pattern val, /^\d+$/
			pattern: (val, arg) ->
				arg.test (val || '').toString()
			required: (val, arg) ->
				Validation.methods.pattern val, /[^\s]/
			date: (val, arg) ->
				Validation.methods.pattern val, /^\d+-\d{2}-\d{2}$/
			confirm: (val, otherField) ->
				@get(otherField) == val
			min: (val, min) ->
				min <= val

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
						if !Validation.methods[method].call @, attrs[field], arg
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
