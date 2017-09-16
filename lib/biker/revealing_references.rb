class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  #
  # This method can now rely on objects and message-sends, such as :rim and
  # :tire instead of relying on the structure of an array that might change
  # in the future.
  #
  # @return [array] Array of diameters for each tire.
  def diameters
    wheels.collect do |wheel|
      wheel.rim + (wheel.tire *2)
    end
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
  # @param data [array] Two-dimensional array that contains values for rims and tires.
  #
  # @return [array] Array of `Wheel` objects
  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end
