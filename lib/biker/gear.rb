require 'wheel'

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring  = chainring
    @cog        = cog
    @wheel      = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # Important here that we are injecting the 'wheel' object instead of manually
    # creating an instance with `Wheel.new(...)`. This way, `Gear` can deal with
    # any thing that responds to the `.diameter` message.
    ratio * wheel.diameter
  end
end
