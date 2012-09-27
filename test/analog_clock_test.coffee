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
    clock       = new AnalogClock()


  it "should have a version", ->
    assert.ok AnalogClock.version


  describe "#constructor", ->

    it "should build an AnalogClock", ->
      clock.should.be.instanceOf AnalogClock

    it "should build a DIV element", ->
      clock._.tagName.should.equal 'DIV'

    it "should add the 'analog-clock' class to it", ->
      clock._.className.should.eql 'analog-clock'

    it "should build 12 numbers", ->
      labels = clock.find('span')
      labels.should.have.length 12
      labels.map('getClass').toArray().should.eql 'num-1,num-2,num-3,num-4,num-5,num-6,num-7,num-8,num-9,num-10,num-11,num-12'.split(',')

    it "should add the three arros", ->
      clock.find('div.arrow.hours').should.have.length 1
      clock.find('div.arrow.minutes').should.have.length 1
      clock.find('div.arrow.seconds').should.have.length 1

    it "should set the default label as 'lovely.io'", ->
      clock.find('label').should.have.length 1
      clock.first('label').html().should.eql 'lovely.io'

    it "should accept the 'label' option", ->
      c = new AnalogClock(label: 'test')
      c.label().should.equal 'test'

    it "should accept the 'time' option", ->
      t = new Date()
      t.setHours(t.getHours() + 3)
      c = new AnalogClock(time: t)
      c.time().should.equal t

  describe '#label()', ->

    it "should return the current label text", ->
      clock.find('label').html('test')
      clock.label().should.eql 'test'

    it "should set a label when one is specified", ->
      clock.label('new label')
      clock.find('label').html().should.eql 'new label'

    it "should return the clock object back when used as a setter", ->
      clock.label('something').should.equal clock

  describe '#time()', ->

    it "should allow to set and get a time", ->
      time = new Date()
      time.setHours(time.getHours() + 2)
      clock.time(time)
      clock.time().should.equal time

    it "should return the clock object itself back when used as a setter", ->
      clock.time(new Date()).should.equal clock





