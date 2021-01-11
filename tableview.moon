mxml    = require "moonxml"
loadkit = require "loadkit"
inspect = require "inspect"

moonxmlFind = loadkit.make_loader "lua"

generate = (tbl) ->
  template = mxml.html\loadluafile moonxmlFind "tableview.template"
  return template tbl, inspect

{ :generate }