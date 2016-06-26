Amen = require "amen"
assert = require "assert"
{join} = require "path"
{read} = require "fairmont"
{yaml} = require "panda-serialize"
compile = require "../src"
files = join __dirname, "data"

Amen.describe "panda-template", (context) ->

  context.test "compile", ->
    template = yield read join files, "template.md"
    data = yaml yield read join files, "data.yaml"
    assert.equal "Hello World\n", compile template, data
