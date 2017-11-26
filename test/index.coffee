import "babel-polyfill"
import {print, test} from "amen"

import basic from "./basic"
import partial from "./partial"
import handlebars from "./handlebars"

do ->
  print await test "Panda Template", [
    test "Basic Render", basic
    test "Render with Partial", partial
    test "Exposes Handlebars Instance", handlebars
  ]
