import "babel-polyfill"
import {print, test} from "amen"

import basic from "./basic"
import partial from "./partial"

do ->
  print await test "Panda Template", [
    test "Basic Render", basic
    test "Render with Partial", partial
  ]
