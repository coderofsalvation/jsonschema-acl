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
      acl: {
        create: ["admin", "user"],
        read:   ["*"],
        update: ["admin"],
        delete: ["admin"],
        rollback: ["admin"]            // feel free to add your own operations
      },
      properties: {
        foo: {
          type: "number"
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

> NOTE: you can override / add acl fields at any place

### Docs 

* see [jsonschema](https://www.npmjs.com/jsonschema) which is used under the hood

### Notes

You don't have to specify acl fields for every field.
The more highlevel the acl-fields are located in the jsonschema-tree, the better.
Try defining them for object-types only for instance.

### Todo 

* test browser version using browserify
