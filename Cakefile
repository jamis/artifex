{spawn, exec} = require 'child_process'

build = (watch, callback) ->
  if typeof watch is 'function'
    callback = watch
    watch = false
  options = ['-c', '-o', 'lib', 'src']
  options.unshift '-w' if watch

  coffee = spawn 'coffee', options
  coffee.stdout.on 'data', (data) -> console.log data.toString()
  coffee.stderr.on 'data', (data) -> console.log data.toString()
  coffee.on 'exit', (status) -> callback?() if status is 0

compile = (callback) ->
  stitch = require 'stitch'
  fs     = require 'fs'

  package = stitch.createPackage paths: ["#{__dirname}/lib"]
  package.compile (err, source) ->
    fs.writeFile 'package.js', source, (err) ->
      throw err if err?
      console.log 'compiled package.js'
      callback?()

compress = (callback) ->
  options = ['-o', 'compressed.js', 'package.js']
  yui = spawn 'yuicompressor', options
  yui.stdout.on 'data', (data) -> console.log data.toString()
  yui.stderr.on 'data', (data) -> console.log data.toString()
  yui.on 'exit', (status) ->
    console.log 'finished compressed.js'
    callback?() if status is 0

task 'build', 'Compile CoffeeScript source files', ->
  build()

task 'compile', 'Stitch all the files together for use in a browser', ->
  build -> compile()

task 'compress', 'Compress the stitched output', ->
  build -> compile -> compress()

task 'test', 'Run the test suite', ->
  build ->
    {reporters} = require 'nodeunit'
    reporters.default.run ['test', 'test/classes', 'test/powers', 'test/races', 'test/rituals']
