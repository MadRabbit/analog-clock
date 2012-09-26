#
# Project's main unit test
#
# Copyright (C) 2012 Nikolay Nemshilov
#
{Test, assert} = require('lovely')

describe "Analog-Clock", ->
  Analog-Clock = null

  before Test.load(module, (build)-> Analog-Clock = build)

  it "should have a version", ->
    assert.ok Analog-Clock.version

