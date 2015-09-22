gulp        = require 'gulp'
coffeelint  = require 'gulp-coffeelint'
coffee      = require 'gulp-coffee'
del         = require 'del'
data        = require 'gulp-data'
watch       = require 'gulp-watch'
mocha       = require 'gulp-mocha'
  
gulp.task 'coffeelint', ->
  gulp.src ['./*.coffee', './test/*.coffee']
    .pipe coffeelint './coffeelint.json'
    .pipe coffeelint.reporter()

gulp.task 'coffee', ->
  gulp.src ['./u-he-hive-meta-parser.coffee']
    .pipe coffee()
    .pipe gulp.dest './'

gulp.task 'default', [
  'coffeelint'
  'coffee'
]

gulp.task 'watch', ->
  gulp.watch './**/*.coffee', ['default']
 
gulp.task 'clean', (cb) ->
  del [
    './*.js'
    './**/*~'
    'node_modules'
    ]
  , force: true
  , cb

gulp.task 'test', ['default'], ->
  gulp.src './test/*.coffee', read: false
    .pipe mocha reporter: 'nyan'

