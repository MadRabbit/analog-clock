#
# Project's main unit
#
# Copyright (C) 2012 Nikolay Nemshilov
#
class AnalogClock extends Element

  constructor: (options)->
    super 'div', options

    @addClass 'analog-clock'

    @html """
      <label class="num-1"></label>
      <label class="num-2"></label>
      <label class="num-3"></label>
      <label class="num-4"></label>
      <label class="num-5"></label>
      <label class="num-6"></label>
      <label class="num-7"></label>
      <label class="num-8"></label>
      <label class="num-9"></label>
      <label class="num-10"></label>
      <label class="num-11"></label>
      <label class="num-12"></label>

      <div class="arrow hours"></div>
      <div class="arrow minutes"></div>
      <div class="arrow seconds"></div>
    """

    @start()

  #
  # Sets up the current time
  #
  # @param {Date} current time
  # @return {AnalogClock} this
  #
  time: (date)->
    time    = date.getHours() * 3600 + date.getMinutes() * 60 + date.getSeconds()

    seconds = @first('.seconds')._.style
    minutes = @first('.minutes')._.style
    hours   = @first('.hours')._.style

    seconds.WebkitTransform     =
    seconds.MozTransform        =
    seconds.MsTransform         =
    seconds.OTransform          =
    seconds.transform           = "rotate("+ Math.round(6 * time - 90) + "deg) translate3d(0,0,0)"

    minutes.WebkitTransform     =
    minutes.MozTransform        =
    minutes.MsTransform         =
    minutes.OTransform          =
    minutes.transform           = "rotate("+ Math.round(6 * Math.floor(time / 60) - 90) + "deg) translate3d(10px,0,0)"

    hours.WebkitTransform       =
    hours.MozTransform          =
    hours.MsTransform           =
    hours.OTransform            =
    hours.transform             = "rotate("+ Math.round(360 / 12 * (time / 3600 % 12) - 90) + "deg) translate3d(20px,0,0)"

    return @

  #
  # Starts the timer
  #
  # @return {AnalogClock} this
  #
  start: ->
    @_timer = window.setInterval =>
      @time new Date()
    , 100
    return @time(new Date())

  #
  # Stops the clock
  #
  # @return {AnalogClock} this
  #
  stop: ->
    window.clearInterval @_timer if @_timer
    return @