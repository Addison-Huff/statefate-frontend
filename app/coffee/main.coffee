requirejs.config {
	baseUrl: 'js/'
	paths:
		backbone: 'lib/backbone'
		underscore: 'lib/underscore'
		jquery: 'lib/jquery'
		fastclick: 'lib/fastclick'
		foundation: 'lib/foundation'
	shim:
		foundation:
			deps: ['fastclick']
		fastclick:
			deps: ['jquery']
	deps: ['app', 'foundation']
	callback: (app) ->
		app.main()
}
