var haml = require('haml'),
	coffee = require('coffee-script'),
	cprocess = require('child_process'),
	events = require('events'),
	http = require('http'),
	fs = require('fs');

module.exports = function(grunt) {
	var buildDir = 'build';
	grunt.initConfig({
		buildDir: buildDir,
		pkg: grunt.file.readJSON('package.json'),
		watch: {
			haml: {
				files: 'app/haml/**/*.haml',
				tasks: ['haml:compile']
			},
			coffee: {
				files: 'app/coffee/**/*.coffee',
				tasks: ['coffee:compile']
			},
			bower: {
				files: 'bower_components/**/*',
				tasks: ['copy:dependencies']
			},
			sass: {
				files: 'app/sass/**/*.scss',
				tasks: ['sass']
			}
		},
		sass: {
			dist: {
				files: function() {
					var files = {};
					files[buildDir + '/css/main.css'] = 'app/sass/main.scss';
					return files;
				}.call()
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-sass');

	grunt.task.registerTask('clean', 'Delete build director', function() {
		grunt.file.delete(grunt.config.get('buildDir'));
	});

	grunt.task.registerTask('copy:html', 'Copy html files', function() {
		grunt.file.recurse('app/html', function(path) {
			grunt.file.copy(path, path.replace(/^app\/html/, grunt.config.get('buildDir')));
		});
	});

	grunt.task.registerTask('copy:img', 'Copy image files', function() {
		grunt.file.recurse('app/img', function(path) {
			grunt.file.copy(path, path.replace(/^app\/img/, grunt.config.get('buildDir') + '/img'));
		});
	});

	grunt.task.registerTask('copy:dependencies', 'Copy bower dependencies', function() {
		var buildDir = grunt.config.get('buildDir');
		grunt.file.copy('bower_components/requirejs/require.js', buildDir + '/js/lib/require.js');
		grunt.file.copy('bower_components/backbone/backbone.js', buildDir + '/js/lib/backbone.js');
		grunt.file.copy('bower_components/underscore/underscore.js', buildDir + '/js/lib/underscore.js');
		grunt.file.copy('bower_components/jquery/dist/jquery.js', buildDir + '/js/lib/jquery.js');
		grunt.file.copy('bower_components/fastclick/lib/fastclick.js', buildDir + '/js/lib/fastclick.js');
		grunt.file.copy('bower_components/foundation/js/foundation.min.js', buildDir + '/js/lib/foundation.js');
		grunt.file.copy('bower_components/foundation/css/foundation.css', buildDir + '/css/foundation.css');
	});

	grunt.task.registerTask('haml:compile', 'Compile haml templates', function() {
		grunt.file.recurse('app/haml', function(path) {
			if(!/\.haml$/.test(path)) {
					return;
			}
			var lines = ('' + fs.readFileSync(path)).replace(/\t/g, function(tab) {
				return '  ';
			});
			try{
				var amdjs = haml.amd(lines);
			}
			catch(e) {
				console.error(e);
			}
			var targetPath = path.replace(/^app\/haml|haml$/g, '');
			grunt.file.write(grunt.config.get('buildDir') + '/js/template/' + targetPath + 'js', amdjs);
		});
	});

	grunt.task.registerTask('coffee:compile', 'Compile coffee', function() {
		grunt.file.recurse('app/coffee', function(path) {
			if(!/\.coffee$/.test(path)) {
				return;
			}
			var lines = '' + fs.readFileSync(path);
			try {
				var js = coffee.compile(lines);
			}
			catch(e) {
				console.error(e.message);
				console.error(path, e.location.first_line + ':' + e.location.first_column);
				console.error(lines.split('\n').slice(e.location.first_line-3, e.location.last_line+2).join('\n'));
				throw Error('Could not compile coffee compile');
			}
			var targetPath = path.replace(/^app\/coffee|coffee$/g, 'js');
			grunt.file.write(grunt.config.get('buildDir') + '/' + targetPath, js);
		});
	});

	grunt.task.registerTask('default', ['clean', 'copy:html', 'copy:img', 'haml:compile', 'coffee:compile', 'copy:dependencies', 'sass', 'watch']);
};
