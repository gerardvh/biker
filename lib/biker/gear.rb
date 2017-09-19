require 'wheel'

#
# Class to compute various things about Gears
#
# @author [gerardvh]
#
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args)
    @chainring  = args[:chainring]
    @cog        = args[:cog]
    @wheel      = args[:wheel]
  end

  def defaults
    {
      chainring:  40,
      cog:        18
    }
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # Important here that we are injecting the 'wheel' object instead of
    # creating an instance with `Wheel.new(...)`. This way, `Gear` can deal with
    # any thing that responds to the `.diameter` message.
    ratio * diameter
  end

  #
  # This is a defensive code-isolation technique. Take *any* references to
  # outside objects or messages to anything other than `self` and isolate them
  # so as to reduce the possibility of creeping dependency on that object.
  #
  # @return [int] Diameter of the `wheel` passed in the `initialize` method.
  def diameter
    wheel.diameter
  end
end
