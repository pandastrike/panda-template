Amen = require "amen"
assert = require "assert"
{join} = require "path"
{read} = require "fairmont"
{yaml} = require "panda-serialize"
{render} = require "../src"
files = join __dirname, "data"

basic = require "./basic"
partial = require "./partial"

Amen.describe "panda-template", (context) ->
  basic context
  partial context
