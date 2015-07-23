v    = require __dirname+'/../index.js'

data = { foo: 4 }

schema =
  type: "object"
  acl: 
    create:["admin","user"]
    read:  ["*"]
    update:["admin"]
    delete:["admin"]
  properties:
    foo:
      type: "number"

# pass wrong roles
result = v.validate(data, schema, "create", "user") 
if result.errors.length != 1
  console.dir result
  process.exit(1) 

# pass correct roles, try to create without having rights
result = v.validate(data, schema, "create", ["user"]) 
if result.errors.length != 0
  console.dir result
  process.exit(1) 

# pass correct roles, try to read
result = v.validate(data, schema, "read", ["user"]) 
if result.errors.length != 0
  console.dir result
  process.exit(1) 

console.log "tests passed"
process.exit(0)

