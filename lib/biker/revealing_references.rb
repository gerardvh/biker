#
# Adding description to make Rubocop happy.
#
# @author [gerardvh]
class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  #
  # First - iterate over the array
  #
  # @return [array] Array of diameters
  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  #
  # Second - calculate the diameter of a single wheel.
  #
  # @param wheel [Wheel] Wheel that responds to :rim and :tire.
  #
  # @return [int] A single diameter.
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  # Here we set up a simple `Struct` to keep our logic for wheels encapsulated.
  Wheel = Struct.new(:rim, :tire)

  #
  # This method serves to turn the abstract array that we might get from `data`
  # into a nice object that responds to messages like `:rim` and `:tire`.
  #
  # This is the only place that we need to know the structure of the array,
  # which is good DRY coding practice.
  #
  # @param data [array] Two-dimensional array that contains values for rims
  # and tires.
  #
  # @return [array] Array of `Wheel` objects
  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end
