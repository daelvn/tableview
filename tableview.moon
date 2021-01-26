mxml    = require "moonxml"
loadkit = require "loadkit"
inspect = require "inspect"
html = mxml.html\buffered!

moonxmlFind = loadkit.make_loader "lua"

generate = (tbl) ->
  html.buffer\truncate(0)
  template = html\loadluafile moonxmlFind "tableview.template"
  template tbl, inspect
  html.buffer\concat

{ :generate }
