local cApi = require("Class")
-- create the class
cApi.class "myClass" {
  foo = function(f)
    print(f)
  end
}
-- include the class
cApi.includeall "myClass"
foo("hello world")
