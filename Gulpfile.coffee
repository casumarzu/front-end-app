gulp = require 'gulp'
$ = require('gulp-load-plugins')()
gulpsync = require("gulp-sync")(gulp)
gutil = require 'gulp-util'
_ = require 'lodash'
# _ = require 'underscore'
chalk = require 'chalk'

###
  configs
###

config =
  production: false

path =
  scripts: "app/scripts/**/*.coffee"
  css: "app/styles/**/*.sass"
  html: "app/html/**/*.jade"
  bower_components: "app/bower_components/**/*.*"
  images: "app/images/**/*.*"

destPath = '.tmp'

getProd = ->
  if config.production
    destPath = 'prod'
  else
    destPath = '.tmp'
  destPath

###
  end configs
###

livereload = require 'gulp-livereload'
connect = require 'gulp-connect'
modRewrite = require 'connect-modrewrite'

gulp.task 'connect', ->
  destPath = getProd()
  connect.server
    root: "#{destPath}"
    livereload: true
    port: 8000

clean = require 'gulp-clean'
vinylPaths = require "vinyl-paths"
del = require "del"

gulp.task "clean", ->
  destPath = getProd()
  gulp.src("#{destPath}/*")
    .pipe vinylPaths(del)

coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

gulp.task "js", ->
  destPath = getProd()
  # unless config.production
  gulp.src path.scripts
    .pipe sourcemaps.init()
    .pipe coffee()
    .pipe sourcemaps.write()
    .pipe gulp.dest "#{destPath}/scripts"
    .pipe connect.reload()
  # else
  #   gulp.src path.scripts
  #     .pipe sourcemaps.init()
  #     .pipe coffee()
  #     .pipe uglify()
  #     .pipe concat "main.js"
  #     .pipe gulp.dest "#{destPath}/scripts"
  #     .pipe connect.reload()


rjs = require "gulp-requirejs"

gulp.task "requirejsBuild", ->
  rjs(
    name: 'main'
    baseUrl: "./prod/scripts"
    out: "main.min.js"
  ).pipe gulp.dest("./prod/scripts")


sass = require 'gulp-sass'
prefix = require 'gulp-autoprefixer'
cssmin = require 'gulp-cssmin'
sourcemaps = require 'gulp-sourcemaps'
concat = require 'gulp-concat'

gulp.task 'sass', ->
  destPath = getProd()
  gulp.src([ path.css ])
  .pipe($.sass(
    sourceComments: 'normal'
    includePaths: [ 'app/bower_components/' ]
    errLogToConsole: true))
  .pipe($.autoprefixer('last 3 version'))
  .pipe gulp.dest("#{destPath}/styles")
  # .pipe(concat("#{destPath}/main.css"))
  .pipe(sass().on('error', sass.logError))
  .pipe connect.reload()
  gulp.src "app/styles/sprite.png"
    .pipe gulp.dest "#{destPath}/styles"
    .pipe connect.reload()


jade = require 'gulp-jade'
minifyHTML = require 'gulp-minify-html'

gulp.task "html", ->
  destPath = getProd()
  gulp.src path.html
    .pipe jade()
    .pipe minifyHTML()
    .pipe gulp.dest "#{destPath}"
    .pipe connect.reload()

svgmin  = require 'gulp-svgmin'

gulp.task "svg", ->
  destPath = getProd()
  gulp.src "app/images/**/*.svg"
    .pipe svgmin()
    .pipe gulp.dest "#{destPath}/images"
    .pipe connect.reload()

gulp.task "copy", ->
  destPath = getProd()
  gulp.src "app/fonts/**/*"
    .pipe gulp.dest "#{destPath}/styles/fonts"
    .pipe connect.reload()
  gulp.src "app/images/**/*"
    .pipe gulp.dest "#{destPath}/images"
    .pipe connect.reload()
  gulp.src "app/styles/sprite.png"
    .pipe gulp.dest "#{destPath}/styles"
    .pipe connect.reload()
  gulp.src "app/bower_components/**/*"
    .pipe gulp.dest "#{destPath}/bower_components/"
    .pipe connect.reload()

gulp.task "watch", ->
  destPath = getProd()
  gulp.watch path.scripts, ["js"]
  gulp.watch path.css, ["sass"]
  gulp.watch path.html, ["html"]
  gulp.watch path.bower_components, ["clean", "copy"]

browserSync = require('browser-sync').create()

gulp.task "browser-sync", -> browserSync.init proxy: "localhost:8000"

cssimage = require 'gulp-css-image'

gulp.task "cssimage", ->
  destPath = getProd()
  gulp.src("app/images/**/**").pipe(cssimage(
    css: false
    scss: true
    prefix:"img_"
    root:"../images"
    name: "_img.scss"
  )).pipe gulp.dest("./app/styles/")

spritesmith = require "gulp.spritesmith"

gulp.task "sprite", ->
  spriteData = gulp.src("app/images/sprites/*.png").pipe(spritesmith(
    imgName: "sprite.png"
    cssName: "_sprite.sass"
  ))
  spriteData.pipe gulp.dest 'app/styles'

gulp.task 'set-prod', -> config.production = true

DEV_TASKS = do ->
  build = [
    'clean'
    'copy'
    'watch'
    'html'
    'js'
    'sprite'
    'sass'
    'cssimage'
    'connect'
    'watch'
    'browser-sync'
  ]
  build

PROD_TASKS = do ->
  build = [
    'set-prod'
    'clean'
    'copy'
    'html'
    'js'
    'requirejsBuild'
    'sprite'
    'sass'
    'cssimage'
    'connect'
  ]
  build

gulp.task 'default', gulpsync.sync DEV_TASKS

gulp.task "prod", gulpsync.sync PROD_TASKS


###
todo запилить прокси сервер
todo запилить сборку в продакшн
todo запилить деплой
###
