require 'spec_helper'
require_relative '../../lib/day_two.rb'

describe 'day_two' do
  context 'part one' do
    describe 'checksum' do
      it 'returns 18' do
        expect(DayTwo.new("spec/support/dummy_data/day_two/spreadsheet.txt").checksum).to eq(18)
      end
    end
  end

  context 'part two' do
    describe 'evenly_divisible_checksum' do
      it 'returns 9' do
        expect(DayTwo.new("spec/support/dummy_data/day_two/part_two_spreadsheet.txt").evenly_divisible_checksum).to eq(9)
      end
    end
  end
end
