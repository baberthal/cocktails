var gulp   = require('gulp');
var config = require('../config');
// var watch  = require('gulp-watch');

gulp.task('watch', ['watchify','browserSync'], function(callback) {
  gulp.watch(config.sass.src, ['sass']);
  gulp.watch(config.images.src, ['images']);
  // watch(config.sass.src, function() { gulp.start('sass'); });
  // watch(config.images.src, function() { gulp.start('images'); });
});
