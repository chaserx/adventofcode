require 'spec_helper'
require_relative '../../lib/day_two.rb'

describe 'day_two' do
  context 'when the spreadsheet exists' do
    describe 'checksum' do
      it 'returns 18' do
        expect(DayTwo.new("spec/support/dummy_data/day_two/spreadsheet.txt").checksum).to eq(18)
      end
    end
  end
end
