path   = require 'path'
assert = require 'assert'
glob   = require 'glob'
parser = require '../u-he-hive-meta-parser'

HIVE_PRESETS_DIR = '/Library/Audio/Presets/u-he/Hive'

describe 'Hive metadata parser', ->
  factoryPresets = undefined

  before (done) ->
    glob "#{HIVE_PRESETS_DIR}/**/*.h2p", (err, files) ->
      factoryPresets = files
      done()
      
  it 'parse all factory presets', ->
    assert.ok factoryPresets?.length, 'there is no preset file'
    for f in factoryPresets
      data = parser.parse f
      if data
        console.info JSON.stringify data
