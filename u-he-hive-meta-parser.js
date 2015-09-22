(function() {
  var fs, parseBuffer, parseString;

  fs = require('fs');

  module.exports.parse = function(filePath) {
    return parseBuffer(fs.readFileSync(filePath));
  };

  module.exports.parseBuffer = parseBuffer = function(b) {
    return parseString(b.toString());
  };

  module.exports.parseString = parseString = function(s) {
    var match, matches;
    if (match = /\/\*\@meta([\s\S]*?)\*\//.exec(s)) {
      if (matches = match[1].match(/^\S+\:.*\n.*/gm)) {
        return eval("({" + (matches.join(',\n')) + "})");
      }
    }
    return {};
  };

}).call(this);
