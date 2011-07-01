{spawn, exec} = require 'child_process'
fs            = require 'fs'

option "-t", "--tests [PATH*]", 'one or more directories or files containing tests to run'

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

  package = stitch.createPackage paths: ["#{__dirname}/lib"]
  package.compile (err, source) ->
    fs.writeFile 'package.js', source, (err) ->
      throw err if err?
      console.log 'compiled package.js'
      callback?()

compress = (callback) ->
  options = ['-o', 'compressed.js', 'package.js']
  yui = spawn 'uglifyjs', options
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

task 'sheet', 'Open the example character sheet generator', ->
  build -> compile -> compress ->
    exec 'open example/sheet.html'

task 'test', 'Run the test suite', (options) ->
  build ->
    {reporters} = require 'nodeunit'
    tests = options.tests || ['test', 'test/classes', 'test/powers', 'test/races', 'test/rituals']
    expanded = []
    for test in tests
      try
        fs.statSync test
        expanded.push test
      catch error
        try
          name = "#{test}.coffee"
          fs.statSync name
          expanded.push name
        catch error
          throw "cannot find anything like `#{test}' to test"
    reporters.default.run expanded
