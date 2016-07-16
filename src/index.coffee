{find, isDefined, identity} = require "fairmont"
sprintf = require "sprintf"
H = require "handlebars"
S = require "swag"
S.registerHelpers H
join = (d, array) -> array.join d

block = (f) ->
  (args..., options) ->
    if options.fn?
      join "", f args..., options.fn
    else
      f args..., identity

H.registerHelper

  let: (args..., options) ->
    options.fn this, data: options.data, blockParams: args

  values: block (object, f) -> f value for key, value of object

  filter: block (property, value, objects, f) ->
    (f object) for object in objects when object[property] == value

  pluck: block (property, objects, f) ->
    (f object[property]) for object in objects

  join: block (delimiter, array, f) ->
    [ join delimiter, array.map f ]

  sprintf: (format, string) -> sprintf format, string

  indent: (n, string) ->
    indent = (" ".repeat n)
    string.replace /\n/g, "\n#{indent}"

  hang: do ->
    indent = (x, s) -> (" ".repeat x) + s
    (i, w, s) ->
      m = w - i
      [first, rest...] = s.match ///.{1,#{m}}(\s+|$)///g
      [first, ((indent i, line) for line in rest)...].join "\n"

  json: (value) -> JSON.stringify value, null, 2

  match: block (re, s, f) ->
    if (k = s.match (new RegExp re, "g"))
      f v for v in k
    else
      []

  replace: (re, r, s) ->
    s.replace (new RegExp re, "g"), r

  pick: (args...) ->
    args.find isDefined

  parsePath: block (s, f) ->
    f p for p in [ "/", s.split("/")[1..]... ]

module.exports = (template, context) ->
  (H.compile template, noEscape: true)(context)
