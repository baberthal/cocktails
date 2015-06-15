(function() {
  var slice = [].slice,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  String.prototype.toCamel = function() {
    return this.replace(/(\-[a-z])/g, function($1) {
      return $1.substring(0, 1).toLowerCase() + $1.substring(0);
    });
  };

  this.NGObject = (function() {
    function NGObject() {
      var dependencies, dependency, i, index, len, ref;
      dependencies = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      ref = this.constructor.$inject;
      for (index = i = 0, len = ref.length; i < len; index = ++i) {
        dependency = ref[index];
        this[dependency.replace('$', '')] = dependencies[index];
      }
      if (typeof this.init === "function") {
        this.init();
      }
    }

    return NGObject;

  })();

  this.NGController = (function(superClass) {
    extend(NGController, superClass);

    function NGController() {
      return NGController.__super__.constructor.apply(this, arguments);
    }

    NGController.register = function(app) {
      app.controller("" + this.name, this);
      return {
        constructor: function(scope) {
          var key, value;
          this.scope = scope;
          for (key in this) {
            value = this[key];
            if (this.scope[key] == null) {
              this.scope[key] = value;
            }
          }
          return NGController.__super__.constructor.register.apply(this, arguments);
        }
      };
    };

    return NGController;

  })(this.NGObject);

  this.NGService = (function(superClass) {
    extend(NGService, superClass);

    function NGService() {
      return NGService.__super__.constructor.apply(this, arguments);
    }

    NGService.register = function(app) {
      return app.service("" + this.name, this);
    };

    NGService.prototype.observableCallbacks = {};

    NGService.prototype.on = function(event_name, callback) {
      var base;
      if ((base = this.observableCallbacks)[event_name] == null) {
        base[event_name] = [];
      }
      return this.observableCallbacks[event_name].push(callback);
    };

    NGService.prototype.notify = function(event_name, data) {
      if (data == null) {
        data = {};
      }
      return angular.forEach(this.observableCallbacks[event_name], function(callback) {
        return callback(data);
      });
    };

    return NGService;

  })(this.NGObject);

  this.NGDirective = (function(superClass) {
    extend(NGDirective, superClass);

    function NGDirective() {
      return NGDirective.__super__.constructor.apply(this, arguments);
    }

    NGDirective.register = function(app) {
      var name;
      name = this.name.substring(0, 1).toLowerCase() + this.name.substring(1);
      return app.directive("" + name, this.prototype.constructor.options);
    };

    NGDirective.options = function() {
      ({
        restrict: 'AE'
      });
      return NGDirective.init() != null;
    };

    return NGDirective;

  })(this.NGObject);

  this.NGAttribute = (function(superClass) {
    extend(NGAttribute, superClass);

    function NGAttribute() {
      return NGAttribute.__super__.constructor.apply(this, arguments);
    }

    NGAttribute.options = function() {
      ({
        restrict: 'A'
      });
      return NGAttribute.__super__.constructor.options.apply(this, arguments);
    };

    return NGAttribute;

  })(this.NGDirective);

  this.NGElement = (function(superClass) {
    extend(NGElement, superClass);

    function NGElement() {
      return NGElement.__super__.constructor.apply(this, arguments);
    }

    NGElement.options = function() {
      ({
        restrict: 'E'
      });
      return NGElement.__super__.constructor.options.apply(this, arguments);
    };

    return NGElement;

  })(this.NGDirective);

}).call(this);
