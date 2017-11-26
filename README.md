# panda-template

[![Build Status](https://travis-ci.org/pandastrike/panda-template.svg)](https://travis-ci.org/pandastrike/panda-template)

Handlebars + Swag + Panda Goodies in a quick and easy interface.

```coffee
import PandaTemplate from "panda-template"
import {read} from "fairmont"
T = new PandaTemplate()

do ->
  template = await read "template.md"
  data = yield read "data.yaml"
  T.registerPartial await read "section1", "section1.md"
  T.registerPartial await read "section2", "section2.md"
  T.render template, data
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
- `json <value>`: serialize into JSON.

[Swag helpers]:http://elving.github.io/swag/

## API

#### `render`
> template, context => rendered template

Outputs a rendered template using Handlebars compile.

#### `registerPartial`
> name, template => null

PandaTemplate associates the Handlebars library as an instance variable when you construct a new PandaTemplate class.  This registers a template partial, at the given name, with that Handlebars instance.

#### `handlebars`
> null => instance of Handlebars

PandaTemplate associates the Handlebars library as an instance variable when you construct a new PandaTemplate class. This exposes that instance for more developer flexibility.
