local mxml = require("moonxml")
local loadkit = require("loadkit")
local inspect = require("inspect")
local moonxmlFind = loadkit.make_loader("moonxml")
local generate
generate = function(tbl)
  local template = mxml.html:loadmoonfile(moonxmlFind("tableview.template"))
  return template(tbl, inspect)
end
return {
  generate = generate
}
