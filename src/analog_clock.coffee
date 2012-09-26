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