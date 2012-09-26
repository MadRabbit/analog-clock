#
# Project's main unit test
#
# Copyright (C) 2012 Nikolay Nemshilov
#
{Test, assert} = require('lovely')

describe "AnalogClock", ->
  AnalogClock = clock = window = document = null

  before Test.load module, (build, win)->
    AnalogClock = build
    window      = win
    document    = win.document


  it "should have a version", ->
    assert.ok AnalogClock.version


  describe "#constructor", ->
    before ->
      clock = new AnalogClock()

    it "should build an AnalogClock", ->
      clock.should.be.instanceOf AnalogClock

    it "should build a DIV element", ->
      clock._.tagName.should.equal 'DIV'

    it "should add the 'analog-clock' class to it", ->
      clock._.className.should.eql 'analog-clock'

    it "should build 12 labels", ->
      labels = clock.find('label')
      labels.should.have.length 12
      labels.map('html').toArray().should.eql '1,2,3,4,5,6,7,8,9,10,11,12'.split(',')

    it "should add the three arros", ->
      clock.find('div.arrow.hours').should.have.length 1
      clock.find('div.arrow.minutes').should.have.length 1
      clock.find('div.arrow.seconds').should.have.length 1




