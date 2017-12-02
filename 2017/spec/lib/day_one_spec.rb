require 'spec_helper'
require_relative '../../lib/day_one.rb'

describe 'day_one' do
  describe 'reverse_captcha' do
    # 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
    # 1111 produces 4 because each digit (all 1) matches the next.
    # 1234 produces 0 because no digit matches the next.
    # 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
    it 'returns 3' do
      expect(DayOne.reverse_captcha(1122)).to eq(3)
    end

    it 'returns 4' do
      expect(DayOne.reverse_captcha(1111)).to eq(4)
    end

    it 'returns 0' do
      expect(DayOne.reverse_captcha(1234)).to eq(0)
    end

    it 'returns 9' do
      expect(DayOne.reverse_captcha(91212129)).to eq(9)
    end
  end
end
