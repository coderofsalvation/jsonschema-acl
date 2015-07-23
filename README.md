jsonschema-acl
==============
jsonschema validator with acl-layer added for nodejs.

Handy validator before doing db inserts, api replies, form submits etc.

### Usage 

    npm install jsonschema-acl

or in the browser:
    
    <script type="text/javascript" src="jsacl.js"></script>

Basically its just jsonschema validation:

    result = v.validate(data, schema ) // this would be GOD-mode

But with extra checks for `acl`-fields

    var v = require("jsonschema-acl");
  
    var data = {
      foo: 4
    };
  
    var schema = {
      type: "object",
      properties: {
        foo: {
          type: "number",
          acl: {
            create: ["admin", "user"],
            read:   ["*"],
            update: ["admin"],
            delete: ["admin"],
            rollback: ["admin"]            // feel free to add your own operations
          }
        }
      }
    };
  
    var user = { roles: ["admin","user"] }   // this would be retrieved from the db somehow 
   
    if( v.validate( data, schema, "create", user.roles ).errors.length ){
      // handle error(s) 
    }else{
      // do db insert 
      // or api reply 
      // or form submission 
      // etc
    
### Docs 

* see [jsonschema](https://www.npmjs.com/jsonschema) which is used under the hood

### Todo 

* test browser version using browserify
