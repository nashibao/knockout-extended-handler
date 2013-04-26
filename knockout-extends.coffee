
ko.bindingHandlers["ext"] = {
  init: (element, valueAccessor) ->
    options = ko.toJS(valueAccessor()) || {}
    for name of options
      _options = options[name]
      try
        $(element)[name](_options)
      catch e
        console.log e
}
