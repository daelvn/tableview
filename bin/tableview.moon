import generate from require "tableview"

loadstring or= load
loaded, err = loadstring "return " .. io.stdin\read "*a"
error err unless loaded
io.write generate loaded!