class Tv
  attr_accessor :hdmi
end

require 'have'

describe Have do
  let(:tv) { Tv.new }
  describe '#has?' do
    it 'executes the presence of the argument as a method on the receiver' do
      tv.has?(:hdmi).should be_false
      tv.hdmi = 1
      tv.has?(:hdmi).should be_true
    end
  end
end
