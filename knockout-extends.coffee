
# jump handler
ko.bindingHandlers.href = {
  init: (element, valueAccessor) ->
    $(element).css("cursor": "pointer");
    $(element).click ()=>
      document.location = valueAccessor()
}

# truncate handler
ko.bindingHandlers.truncate = ()=>
    init: (element, valueAccessor, allBindingsAccessor, context) =>
        options = ko.toJS(valueAccessor()) || {}
        length = options.length
        text = options.text
        if text.length > length
            text = text[0:length]
        typeof element.innerText == "string" ? element.innerText = text : element.textContent = text

# highlight handler
ko.bindingHandlers.highlight = update: (element, valueAccessor, allBindingsAccessor, context) =>
  words = ko.toJS(valueAccessor()) || {}
  words = words.split(',')
  text = element.textContent
  for word in words
    if word
      re = new RegExp(word, "g");
      text = text.replace(re, '<strong>'+word+'</strong>')
  $(element).html(text)

# jquery plugins extends
# do ->
#   jquery_extenders = ['datepicker']
#   for ext in jquery_extenders
#     ko.bindingHandlers[ext] = do (ext) ->
#       {
#         init: (element, valueAccessor) ->
#           options = ko.toJS(valueAccessor()) || {}
#           try
#             $(element)[ext](options)
#           catch e
#             utils.log e
#       }
#   null

# bootstrap extends
# do ->
#   for ext in ['tooltip', 'popover']
#     ko.bindingHandlers[ext] = do(ext) ->
#       {
#         init: (element, valueAccessor, allBindingsAccessor, viewModel) ->
#           try
#             options = valueAccessor()
#             options?.trigger ?= 'manual'
#             if options?.trigger is 'manual'
#               $(element)[ext](options)
#               $(element).click ->
#                 $(@)[ext]('hide')
#               .mouseenter ->
#                 $(@)[ext]('show')
#               .mouseleave ->
#                 $(@)[ext]('hide')
#           catch e
#             utils.log e
#       }
#   null

ko.bindingHandlers["ext"] = {
  init: (element, valueAccessor) ->
    options = ko.toJS(valueAccessor()) || {}
    for name of options
      _options = options[name]
      try
        $(element)[name](_options)
      catch e
        utils.log e
}

# stop binding handler
# http://www.knockmeout.net/2012/05/quick-tip-skip-binding.html
ko.bindingHandlers.stopBinding = init: ->
  controlsDescendantBindings: true

ko.virtualElements.allowedBindings.stopBinding = true
