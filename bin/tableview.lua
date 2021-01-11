local generate
generate = require("tableview").generate
local loadstring = loadstring or load
local loaded, err = loadstring("return " .. io.stdin:read("*a"))
if not (loaded) then
  error(err)
end
return io.write(generate(loaded()))
