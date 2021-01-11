mxml    = require "moonxml"
loadkit = require "loadkit" 
inspect = require "inspect"

moonxmlFind = loadkit.make_loader "moonxml"

generate = (tbl) ->
  template = mxml.html\loadmoonfile moonxmlFind "tableview.template"
  return template tbl, inspect

{ :generate }