local Class = {}
Class.classes = {}
function gd()
	local date = os.date("*t") -- date table
	local hour = date.hour
	local min = date.min
	local sec = date.sec
	return hour..":"..min..":"..sec
end

function apiError(t)
	print("[Class]\32"..t.."\n["..gd().."]")
end
function apiWarn(t)
	print("[Class]\32"..t.."\n["..gd().."]")
end
function apiPrint(t)
	print("[Class]\32"..t)
end

function Class.class(name)
	if(name=="") or (name==nil) then apiError("Invalid Class name") return end
	apiPrint("Added \""..name.."\" to class table")
	return (function(args) table.insert(Class.classes,{CLASSNAME = name, METHODS = args}) getfenv(2)[name] = args end)
end
function Class.sealed(name)
	if(name=="") or (name==nil) then apiError("Invalid Class name") return end
	return (function(args) table.insert(Class.classes,{CLASSNAME = name, METHODS = args}) getfenv(2)[name] = args end)
end
function Class.include(name)
	if(name=="") or (name==nil) then apiError("Invalid Class name") return end
	apiPrint("Checking for Class")
	for _,class in pairs(Class.classes) do
		if (class.CLASSNAME:lower() == name:lower()) then
			apiWarn("Found class!")
			getfenv(2)[name] = class.METHODS
			return
		end
	end
	apiError("Could not find any classes")
end
function Class.includeall(name)
	if(name=="") or (name==nil) then apiError("Invalid Class name") return end
	apiWarn("Checking for \""..name.."\"")
	for _,class in pairs(Class.classes) do
		if (class.CLASSNAME:lower() == name:lower()) then
			apiWarn("Found class!")
			for a, b in pairs(class.METHODS) do
				getfenv(2)[a] = b
			end
			return
		end 
	end
	apiError("No classs found")
end
apiWarn("Loaded Class")
return Class
