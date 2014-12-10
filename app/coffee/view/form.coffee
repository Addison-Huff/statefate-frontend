define [
	'view/base',
	'backbone',
	'underscore'
], (
	BaseView,
	Backbone,
	_
) ->
	FormView = BaseView.extend
		el: 'form'
		initialize: (options) ->
			this.formModel = options?.formModel || new Backbone.Model()

		events:
			'change select': 'changeSelect'
			'click input[type="radio"]': 'clickRadio'
			'click input[type="checkbox"]': 'clickCheckbox'
			'input input:not(input[type="radio"], input[type="checkbox"])': 'changeInput'
			'change input:not(input[type="radio"], input[type="checkbox"])': 'changeInput'
			'input textarea': 'changeInput'
			'submit': 'validate'

		validate: (e) ->
			e.preventDefault()
			if @formModel.isValid()
				this.submit(e)

		bindFormToModel: ->
			form = @$el
			@listenTo @formModel, 'change', (model, options) ->
				_.each _.keys(model.changed), (attr) ->
					value = model.changed[attr]
					inputs = form.find "[name=\"#{attr}\"]"

					inputs
						.filter '[type="radio"], [type="checkbox"]'
						.filter "[value=\"#{value}\"]"
						.prop 'checked', true

					inputs
						.filter 'input:not([type="radio"], [type="checkbox"]), select'
						.val value

		changeSelect: (e) ->
			input = @$ e.target
			@formModel.set input.attr('name'), input.val(), { silent: true }

		clickRadio: (e) ->
			input = @$ e.target
			@formModel.set input.attr('name'), input.val(), { silent: true }

		clickCheckbox: (e) ->
			input = @$ e.target
			values = (@$(input).val() for input in @$el.find('input[type="checkbox"][name="' + input.attr('name') + '"]:checked').toArray())
			@formModel.set input.attr('name'), values, { silent: true }

		changeInput: (e) ->
			input = @$ e.target
			@formModel.set input.attr('name'), input.val(), { silent: true }

		render: ->
			@bindFormToModel()
			console.log @formModel
			@listenTo @formModel, 'invalid', (model, messages) ->
				for message in messages
					field = @$el.find "label.#{message.field}"
					errors = field.addClass("error").find "small.error"
					if !errors.length
						errors = Backbone.$('<small class="error"><small>')
						field.append errors

					errors.text message.messages

			@listenTo @formModel, 'change', (model) ->
				for field, __ of model.changed
					@$el
						.find "label.#{field}"
						.removeClass "error"
						.find("small.error").remove()
