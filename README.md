# Lua-classApi
#### This is used to make some simple or even advanced classes.
## Usage
#### Using this is as simple as making a class, and including it in a different .lua file
#### Here is a good example
### Script 1 (Creating the class)
```lua
local cApi = require("Class")
cApi.class "MyClass" {
  foo = function(f)
    print(f)
  end
}
```
### Script 2 (Including the file)
#### Before we move on to this, we should know some basic knowledge of cApi's include functions
#### There are 2 types of "includes"
#### The first type is the normal "include"
#### This could be a bit more challenging but a lot more organized.
```lua
local cApi = require("Class")
cApi.include "MyClass" -- get the class from Script 1

MyClass.foo("Hello world")
```
#### As you can see, it is very advanced and uses a simple style.
#### Using include all is (in my opinion) easier than using normal .include. So let's try it.
```lua
local cApi = require("Class")
cApi.includeall "MyClass" -- get all methods

foo("Hello world")
```

#### I hope this simplifies most of cApi.
# Why should I use it?
#### Because you **should**
