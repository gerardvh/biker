require 'wheel'

RSpec.describe Wheel do
  it 'computes circumference' do
    wheel = Wheel.new(26, 1.5)

    expect(wheel.circumference).to be_within(0.2).of(91)
  end
end
