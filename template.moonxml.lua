local tbl, inspect = ...
local ROOT
ROOT = function() end
local stack = {
  push = table.insert,
  pop = table.remove,
  find = function(self, target)
    for index, item in ipairs(self) do
      if item == target then
        return index
      end
    end
  end
}
local dump
dump = function(k, v)
  if k == nil then
    k = ROOT
  end
  return div({
    class = "pair"
  }, function()
    return div({
      class = "kv value"
    }, function()
      local _exp_0 = type(v)
      if "table" == _exp_0 then
        return details(function()
          summary(function()
            if k ~= ROOT then
              div({
                class = "kv key"
              }, function()
                span("[")
                span({
                  class = "code-" .. tostring(type(k))
                }, inspect(k))
                return span("] = ")
              end)
            end
            local len = 0
            for kk, vv in pairs(v) do
              len = len + 1
            end
            span({
              class = "summary"
            }, "Table (" .. tostring(len) .. ")")
            return span({
              class = "object"
            }, tostring(v))
          end)
          if stack:find(v) then
            return b("(Recursion)")
          else
            stack:push(v)
            local tpairs = { }
            for kk, vv in pairs(v) do
              table.insert(tpairs, {
                kk,
                vv
              })
            end
            table.sort(tpairs, function(a, b)
              a, b = a[1], b[1]
              if type(a < type(b)) then
                return true
              elseif type(a > type(b)) then
                return false
              else
                if type(a == "number") then
                  return a < b
                else
                  return tostring(a < tostring(b))
                end
              end
            end)
            for idx, pair in ipairs(tpairs) do
              dump(pair[1], pair[2])
            end
            return stack:pop()
          end
        end)
      else
        if k ~= ROOT then
          div({
            class = "kv key"
          }, function()
            span("[")
            span({
              class = "code-" .. tostring(type(k))
            }, inspect(k))
            return span("] = ")
          end)
        end
        return div({
          class = "kv code-" .. tostring(type(v))
        }, inspect(v))
      end
    end)
  end)
end
print("<!doctype html>")
return html(function()
  head(function()
    return style(function()
      return print([[      details > *:not(summary) {
        padding-left: 2em;
      }
  
      #main {
        font-family: Fira Code, 'Courier New', Courier, monospace;
      }
            
      span.object {
        color: #aaa;
        font-size: 0.7em;
      }
  
      div.pair {
        margin: 0.5em;
        display: flex;
      }
  
      div.kv {
        display: inline;
        width: max-content;
      }
  
      details,
      details[open],
      details:focus {
        outline: 0;
        outline-color: #fff;
      }
  
      .code-string {
        color: green;
      }
  
      .code-number {
        color: purple;
      }
  
      .code-boolean {
        color: gold;
      }
  
      .code-function {
        color: blue;
      }
  
      .code-table {
        color: brown;
      }

      details > summary {
        list-style: none;
      }
      details > summary::-webkit-details-marker {
        display: none;
      }
      details > summary::after {
        content: "\25BC";
        display: inline-block;
        transform: rotate(-90deg);
        margin-left: .6em;
      }
      
      details[open] > summary::after {
        transform: none;
      }
      
      :focus {
        outline: none;
      }
    ]])
    end)
  end)
  return body(function()
    return div({
      id = "main"
    }, function()
      return dump(ROOT, tbl)
    end)
  end)
end)
