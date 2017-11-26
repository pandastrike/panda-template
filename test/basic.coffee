import assert from "assert"
import {join} from "path"
import {read} from "fairmont"
import {yaml} from "panda-serialize"
import pandatemplate from "../src"

test = ->
  files = join __dirname, "data", "basic"
  T = new pandatemplate()
  template = yield read join files, "template.md"
  data = yaml yield read join files, "data.yaml"
  assert.equal (T.render template, data),
    """
    Hello World
    apple-pie, cherry-pie, peach-pie
    """

export default test
