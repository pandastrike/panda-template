# panda-template

Handlebars + Swag + Panda Goodies in a quick and easy interface.

```coffee
render = require "panda-template"
template = yield read "template.md"
data = yield read "data.yaml"
render template, data
```

Built on Handlebars and auto-includes support
for all [Swag helpers][].

In addition, we include the following helpers:

- `values`: return the values of an object.
- `filter <property> <value>`: selects objects whose `<property>` is the given `<value>`.
- `pluck <property>`: maps an array of objects into an array of values using the given `<property>`.
- `join <delimiter>`: converts an array to a string using the given `<delimiter>`.
- `sprintf <format> <string>`: formats the `<string>` using the printf-style `<format>` string.
- `hang <indent> <width> <string>`: Format `<string>` with a hanging indent
of `<indent>` spaces and line `<width>`.

[Swag helpers]:http://elving.github.io/swag/
