var browserify   = require('browserify');
var browserSync  = require('browser-sync');
var watchify     = require('watchify');
var mergeStream  = require('merge-stream');
var bundleLogger = require('../util/bundleLogger');
var gulp         = require('gulp');
var handleErrors = require('../util/handleErrors');
var source       = require('vinyl-source-stream');
var config       = require('../config').browserify;
var _            = require('lodash');

var browserifyTask = function(callback, devMode) {
  var bundleQueue = config.bundleConfigs.length;

  var browserifyThis = function(bundleConfig) {
    if (devMode) {
      _.extend(bundleConfig, watchify.args, { debug: true });
      bundleConfig = _.omit(bundleConfig, ['external', 'require']);
    }

    var b = browserify(bundleConfig);

    var bundle = function() {
      bundleLogger.start(bundleConfig.outputName);

      return b
        .bundle()
        .on('error', handleErrors)
        .pipe(source(bundleConfig.outputName))
        .pipe(gulp.dest(bundleConfig.dest))
        .on('end', reportFinished)
        .pipe(browserSync.reload({
          stream: true
        }));
    };

    if (devMode) {
      b = watchify(b);
      b.on('update', bundle);
      bundleLogger.watch(bundleConfig.outputName);
    } else {
      if(bundleConfig.require) b.require(bundleConfig.require);
      if(bundleConfig.external) b.external(bundleConfig.external);
    }

    var reportFinished = function() {
      bundleLogger.end(bundleConfig.outputName);

      if (bundleQueue) {
        bundleQueue--;
        if (bundleQueue === 0) {
          callback();
        }
      }
    };

    return bundle();
  };

  return mergeStream.apply(gulp, _.map(config.bundleConfigs, browserifyThis));
  // config.bundleConfigs.forEach(browserifyThis);
};

gulp.task('browserify', function() {
  return browserifyTask();
});
// gulp.task('browserify', browserifyTask);

module.exports = browserifyTask;
