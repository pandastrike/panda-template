assert = require "assert"
{join} = require "path"
{read} = require "fairmont"
{yaml} = require "panda-serialize"
pandatemplate = require "../src"
files = join __dirname, "data", "basic"

module.exports = (context) ->
  context.test "Basic Render", ->
    T = new pandatemplate()
    template = yield read join files, "template.md"
    data = yaml yield read join files, "data.yaml"
    assert.equal (T.render template, data),
      """
      Hello World
      apple-pie, cherry-pie, peach-pie
      """
