import generate from require 'tableview'

describe 'tableview', ->
  describe 'generate', ->
    it 'returns a string', ->
      assert.is.string generate {}
    it 'handles recursion gracefully', ->
      t={}
      t[t]=t
      assert.has.no.errors -> generate(t)
