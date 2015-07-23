jsonschema = require 'jsonschema'

Validator = require('jsonschema').Validator
v = new Validator()

v.attributes.acl = (data, schema, options, ctx) ->
  return if not options.operation? or not options.roles?
  return "roles-variable of validate() should be array of strings" if typeof options.roles == "string"
  return if "*" in schema.acl[ options.operation ] 
  for role in options.roles
    return if role in schema.acl[ options.operation ] 
  return "this operation ("+options.operation+") is not allowed for this user"

exports.parent = v

exports.validate = (data, schema, operation, roles ) ->
  v.validate(data,schema, {operation:operation, roles:roles} ) 

