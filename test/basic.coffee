import assert from "assert"
import {join} from "path"
import {read} from "panda-quill"
import {yaml} from "panda-serialize"
import pandatemplate from "../src"

test = ->
  files = join __dirname, "..", "..", "..", "test", "data", "basic"
  T = new pandatemplate()
  template = await read join files, "template.md"
  data = yaml await read join files, "data.yaml"
  assert.equal (T.render template, data),
    """
    Hello World
    apple-pie, cherry-pie, peach-pie
    """

export default test
