require 'spec_helper'
require_relative '../../lib/day_three.rb'

describe DayThree do
  describe 'steps' do
    it 'returns 0 if from square 1' do
      expect(DayThree.new.steps(1)).to eq(0)
    end

    it 'returns 3 if from square 12' do
      expect(DayThree.new.steps(12)).to eq(3)
    end

    it 'returns 2 if from square 23' do
      expect(DayThree.new.steps(23)).to eq(2)
    end

    it 'returns 31 if from square 1024' do
      expect(DayThree.new.steps(1024)).to eq(31)
    end
  end
end
