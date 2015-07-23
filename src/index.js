// Generated by CoffeeScript 1.9.3
(function() {
  var Validator, jsonschema, v,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  jsonschema = require('jsonschema');

  Validator = require('jsonschema').Validator;

  v = new Validator();

  v.attributes.acl = function(data, schema, options, ctx) {
    var i, len, ref, role;
    if ((options.operation == null) || (options.roles == null)) {
      return;
    }
    if (typeof options.roles === "string") {
      return "roles-variable of validate() should be array of strings";
    }
    if (indexOf.call(schema.acl[options.operation], "*") >= 0) {
      return;
    }
    ref = options.roles;
    for (i = 0, len = ref.length; i < len; i++) {
      role = ref[i];
      if (indexOf.call(schema.acl[options.operation], role) >= 0) {
        return;
      }
    }
    return "this operation (" + options.operation + ") is not allowed for this user";
  };

  exports.validate = function(data, schema, operation, roles) {
    return v.validate(data, schema, {
      operation: operation,
      roles: roles
    });
  };

}).call(this);