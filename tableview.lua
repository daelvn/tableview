local mxml = require("moonxml")
local loadkit = require("loadkit")
local inspect = require("inspect")
local html = mxml.html:buffered()
local moonxmlFind = loadkit.make_loader("lua")
local generate
generate = function(tbl)
  html.buffer:truncate(0)
  local template = html:loadluafile(moonxmlFind("tableview.template"))
  template(tbl, inspect)
  return html.buffer:concat()
end
return {
  generate = generate
}
