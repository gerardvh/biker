require "spec_helper"

RSpec.describe Biker do
  it "has a version number" do
    expect(Biker::VERSION).not_to be nil
  end
end
