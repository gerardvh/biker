require 'spec_helper'
require 'gear'

RSpec.describe Gear do
  context 'when it has a wheel' do
    wheel = Wheel.new(26, 1.5)

    it 'computes gear inches' do
      gi = Gear.new(52, 11, wheel).gear_inches
      expect(gi).to be_within(0.1).of(137)
    end
  end
end
