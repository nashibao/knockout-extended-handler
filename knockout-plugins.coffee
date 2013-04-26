
# stop binding handler
# http://www.knockmeout.net/2012/05/quick-tip-skip-binding.html
ko.bindingHandlers.stopBinding = init: ->
  controlsDescendantBindings: true

ko.virtualElements.allowedBindings.stopBinding = true

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
