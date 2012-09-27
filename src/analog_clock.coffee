#
# Project's main unit
#
# Copyright (C) 2012 Nikolay Nemshilov
#
class AnalogClock extends Element

  #
  # Basic constructor
  #
  # @param {Object} options
  # @return {AnalogClock} this
  #
  constructor: (options)->
    options or= {}
    time      = options.time  || new Date()
    label     = options.label || 'lovely.io'

    delete(options.time)
    delete(options.label)

    super 'div', options

    @addClass 'analog-clock'

    @html """
      <label>#{label}</label>

      <span class="num-1"></span>
      <span class="num-2"></span>
      <span class="num-3"></span>
      <span class="num-4"></span>
      <span class="num-5"></span>
      <span class="num-6"></span>
      <span class="num-7"></span>
      <span class="num-8"></span>
      <span class="num-9"></span>
      <span class="num-10"></span>
      <span class="num-11"></span>
      <span class="num-12"></span>

      <div class="arrow hours"></div>
      <div class="arrow minutes"></div>
      <div class="arrow seconds"></div>
    """

    @time(time).start()

    return @

  #
  # Sets/Gets the label text
  #
  label: (text)->
    if text is undefined
      return @find('label').html()
    else
      @find('label').html(text)

    return @

  #
  # Sets up the current time
  #
  # @param {Date|Number} current time
  # @return {AnalogClock} this
  #
  time: (time)->
    if time is undefined
      return @_time
    else
      @move(@_time = new Date(time))
      @_offset     = new Date() - @_time

    return @

  #
  # Starts the timer
  #
  # @return {AnalogClock} this
  #
  start: ->
    @_timer = window.setInterval =>
      @move new Date(new Date() - @_offset)
    , 100

    return @

  #
  # Stops the clock
  #
  # @return {AnalogClock} this
  #
  stop: ->
    window.clearInterval @_timer if @_timer
    return @

  #
  # Moves the clock hands to the specified time position
  #
  # @param {Date|Number} time
  # @return {AnalogClock} self
  #
  move: (time)->
    time   = new Date(time)
    time   = time.getHours() * 3600 + time.getMinutes() * 60 + time.getSeconds()

    rotate = (css_rule, deg)=>
      style = @first(css_rule)._.style

      style.WebkitTransform     =
      style.MozTransform        =
      style.MsTransform         =
      style.transform           = "rotate("+ deg + "deg) translate3d(0,0,0)"
      style.OTransform          = "rotate("+ deg + "deg)" # doesn't support translate3d

    rotate '.seconds', 360/60 * time
    rotate '.minutes', 360/60 * Math.floor(time/60)
    rotate '.hours',   360/12 * (time / 3600 % 12)

    return @

