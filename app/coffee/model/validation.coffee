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
				if val
					arg.test (val || '').toString()
				else
					true

			required: (val, field, arg) ->
				val && Validation.methods.pattern val, field, /[^\s]/

			date: (val, field, arg) ->
				Validation.methods.pattern val, field, /^\d+-\d{2}-\d{2}$/

			confirm: (val, field, otherField) ->
				@get(otherField) == val

			min: (val, field, min) ->
				min <= val

			type: (val, field, Type) ->
				val || @.set field, (new Type(val)).valueOf()

			minLength: (val, field, length) ->
				if val
					(val || '').toString().length >= length
				else 
					true

			maxLength: (val, field, length) ->
				if val
					val.toString().length <= length
				else
					true

		messages:
			required: (field) -> "#{field} is required"
			number: (field) -> "#{field} must be a number"
			pattern: (field) -> "#{field} must be a valid format"
			date: (field) -> "#{field} must be YYYY-MM-DD"
			confirm: (field) -> "#{field} does not match"
			min: (field, arg) -> "#{field} must be at least #{arg}"
			minLength: (field, arg) -> "#{field} must be at least #{arg} characters"
			maxLength: (field, arg) -> "#{field} can be at most #{arg} characters"

		mixin:
			validate: (attrs) ->
				messages = for field, methods of @fields
					fieldMessages = for method, args of methods
						validationMethod = Validation.methods[method]
						messageArg = ''
						if !(args instanceof Array)
							args = [args]
						args = args[..]
						if args.length == 2
							messageArg = args.pop()
						if args.length > 2
							throw Error(method + ' attr is an array of length > 2')
						args = [attrs[field], field].concat(args)
						if validationMethod && !validationMethod.apply @, args
							messageArg || Validation.messages[method] field.camelToSpace().capitalize(), args.pop()
					fieldMessages = (message for message in fieldMessages when message)
					if fieldMessages.length > 0
						fieldMessage = {}
						fieldMessage.field = field
						fieldMessage.messages = fieldMessages
						fieldMessage

				messages = (message for message in messages when message)

				if messages.length
					_.flatten messages
