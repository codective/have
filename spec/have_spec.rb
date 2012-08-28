class Tv
  attr_accessor :hdmi, :active3d, :passive3d, :internet, :wireless
end

require 'have'

describe Have do
  let(:tv) { Tv.new }
  describe '#has?' do
    it 'executes the presence of the argument as a method on the receiver' do
      tv.has?(:hdmi).should be_false
      tv.hdmi = 1
      tv.has?(:hdmi).should be_true
      tv.hdmi = false
      tv.has?(:hdmi).should be_false
    end
  end

  describe '#has_any?' do
    it 'works on values for an array receiver' do
      [1,2,3].has_any?(1). should be_true
      [1,2,3].has_any?(4). should be_false
      [1,2,3].has_any?(2, 7). should be_true
      [1,2,3].has_any?(6, 7). should be_false
    end
    it 'checks for the presence of any argument as a method on the receiver' do
      tv.internet = true
      tv.has_any?(:internet, :active3d). should be_true
      tv.has_any?(:active3d, :passive3d). should be_false
    end
  end

  describe '#has_all?' do
    it 'works on values for an array receiver' do
      [1,2,3].has_all?(1, 2). should be_true
      [1,2,3].has_all?(1, 7). should be_false
      [1,2,3].has_all?(6, 7). should be_false
    end
    it 'does not accont for order' do
      [1,2,3].has_all?(2, 1). should be_true
    end
    it 'checks for the presence of all argument as a method on the receiver' do
      tv.hdmi = tv.internet = tv.wireless = true
      tv.has_all?(:internet, :wireless). should be_true
      tv.has_all?(:wireless, :passive3d). should be_false
    end
  end
end
