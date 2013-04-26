// Generated by CoffeeScript 1.6.2
(function() {
  var _this = this;

  ko.bindingHandlers.href = {
    init: function(element, valueAccessor) {
      var _this = this;
      $(element).css({
        "cursor": "pointer"
      });
      return $(element).click(function() {
        return document.location = valueAccessor();
      });
    }
  };

  ko.bindingHandlers.truncate = function() {
    return {
      init: function(element, valueAccessor, allBindingsAccessor, context) {
        var length, options, text, _ref;
        options = ko.toJS(valueAccessor()) || {};
        length = options.length;
        text = options.text;
        if (text.length > length) {
          text = text[{
            0: length
          }];
        }
        return (_ref = typeof element.innerText === "string") != null ? _ref : element.innerText = {
          text: element.textContent = text
        };
      }
    };
  };

  ko.bindingHandlers.highlight = {
    update: function(element, valueAccessor, allBindingsAccessor, context) {
      var re, text, word, words, _i, _len;
      words = ko.toJS(valueAccessor()) || {};
      words = words.split(',');
      text = element.textContent;
      for (_i = 0, _len = words.length; _i < _len; _i++) {
        word = words[_i];
        if (word) {
          re = new RegExp(word, "g");
          text = text.replace(re, '<strong>' + word + '</strong>');
        }
      }
      return $(element).html(text);
    }
  };

  ko.bindingHandlers["ext"] = {
    init: function(element, valueAccessor) {
      var e, name, options, _options, _results;
      options = ko.toJS(valueAccessor()) || {};
      _results = [];
      for (name in options) {
        _options = options[name];
        try {
          _results.push($(element)[name](_options));
        } catch (_error) {
          e = _error;
          _results.push(utils.log(e));
        }
      }
      return _results;
    }
  };

  ko.bindingHandlers.stopBinding = {
    init: function() {
      return {
        controlsDescendantBindings: true
      };
    }
  };

  ko.virtualElements.allowedBindings.stopBinding = true;

}).call(this);
