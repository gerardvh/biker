class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  #
  # This is a bad method because it *depends on* a particular structure to the
  # `data`, which it does not control.
  # This will cause many issues in the future, as many other methods will also
  # need to depend on this structure, which might change.
  #
  # @return [array] [array of diameters for the `data` structure]
  def diameters
    # 0 is rim, 1 is tire
    data.collect do |cell|
      cell[0] + (cell[1] * 2)
    end
  end
end
