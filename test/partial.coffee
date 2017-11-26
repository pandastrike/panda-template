assert = require "assert"
{join} = require "path"
{read} = require "fairmont"
{yaml} = require "panda-serialize"
pandatemplate = require "../src"
files = join __dirname, "data", "partial"

module.exports = (context) ->
  context.test "Render with Partial", ->
    T = new pandatemplate()
    template = yield read join files, "template.md"
    partialTemplate = yield read join files, "cookies.md"
    data = yaml yield read join files, "data.yaml"

    T.registerPartial "cookies", partialTemplate
    assert.equal (T.render template, data),
      """
      Hello World
      apple-pie, cherry-pie, peach-pie
      chocolate-chip-cookie, snickerdoodle-cookie, sugar-cookie
      """
