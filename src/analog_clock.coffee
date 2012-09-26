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
      <label>1</label>
      <label>2</label>
      <label>3</label>
      <label>4</label>
      <label>5</label>
      <label>6</label>
      <label>7</label>
      <label>8</label>
      <label>9</label>
      <label>10</label>
      <label>11</label>
      <label>12</label>

      <div class="arrow hours"></div>
      <div class="arrow minutes"></div>
      <div class="arrow seconds"></div>
    """