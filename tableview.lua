local mxml = require("moonxml")
local loadkit = require("loadkit")
local moonxmlFind = loadkit.make_loader("moonxml")
local generate
generate = function(tbl)
  local template = mxml.html:loadmoonfile(moonxmlFind("tableview.template"))
  return template(tbl)
end
return {
  generate = generate
}
