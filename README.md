jsonschema-acl
==============
jsonschema validator with acl-layer added for nodejs.

Handy validator before doing db inserts, api replies, form submits etc.

### Usage 

Basically its just jsonschema validation which checks for an `acl`-field

    var data, result, schema, v;
  
    var v = require(__dirname + '/../index.js');
  
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
            read: ["*"],
            update: ["admin"],
            "delete": ["admin"]
          }
        }
      }
    };
  
    var user = { roles: ["admin","user"] }   // this would be retrieved from the db somehow 
  
    if( v.validate(data, schema, "create", user.roles ).errors.length ){
      // handle error(s) 
    }else{
      // do db insert 
      // or api reply 
      // or form submission 
      // etc

### Docs 

* see [jsonschema](https://www.npmjs.com/jsonschema) which is used under the hood
