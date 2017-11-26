import assert from "assert"
import {join} from "path"
import {read} from "fairmont"
import {yaml} from "panda-serialize"
import pandatemplate from "../src"

test = ->
  files = join __dirname, "data", "partial"
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

export default test
