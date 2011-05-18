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

task 'build', 'Compile CoffeeScript source files', ->
  build()

task 'test', 'Run the test suite', ->
  build ->
    {reporters} = require 'nodeunit'
    reporters.default.run ['test', 'test/classes', 'test/powers', 'test/races']
