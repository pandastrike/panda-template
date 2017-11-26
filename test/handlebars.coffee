import assert from "assert"
import pandatemplate from "../src"

test = ->
  T = new pandatemplate()
  assert.equal T.handlebars().constructor.name, "HandlebarsEnvironment"

export default test
