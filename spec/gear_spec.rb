require 'spec_helper'
require 'gear'

RSpec.describe Gear do
  it 'computes gear inches' do
    gi = Gear.new(52, 11, 26, 1.5).gear_inches
    expect(gi).not_to be nil
  end
end
