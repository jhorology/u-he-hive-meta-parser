fs = require 'fs'

module.exports.parse = (filePath) ->
  parseBuffer fs.readFileSync filePath

module.exports.parseBuffer = parseBuffer = (b) ->
  parseString b.toString()
  
module.exports.parseString = parseString = (s) ->
  # has meta block
  if match = /\/\*\@meta([\s\S]*?)\*\//.exec s
    if matches = match[1].match /^\S+\:.*\n.*/gm
      return eval "({#{matches.join ',\n'}})"
  return {}
  
