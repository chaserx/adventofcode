require 'spec_helper'
require_relative '../../lib/day_four.rb'

describe Policy::Passphrase do
  describe 'valid?' do
    context 'when a word appears more than once' do
      it 'returns false' do
        expect(Policy::Passphrase.new("aa bb cc dd aa").valid?).to be false
      end
    end

    context 'when a word appears only once' do
      it 'returns true' do
        expect(Policy::Passphrase.new("aa bb cc dd ee").valid?).to be true
      end
    end

    context 'when a word appears only once but have similar words' do
      it 'returns true' do
        expect(Policy::Passphrase.new("aa bb cc dd aaa").valid?).to be true
      end
    end
  end
end

describe 'DayFour' do
  describe 'good_passphrases' do
    context 'when the file contains phrases' do
      it 'returns 2' do
        expect(DayFour.new('spec/support/dummy_data/day_four/input.txt').good_passphrases.count).to eq(2)
      end
    end

    context 'when the file is empty' do
      it 'returns 0' do
        expect(DayFour.new('spec/support/dummy_data/day_four/empty.txt').good_passphrases.count).to eq(0)
      end
    end
  end

  describe 'poor_passphrases' do
    context 'when the file contains phrases' do
      it 'returns 1' do
        expect(DayFour.new('spec/support/dummy_data/day_four/input.txt').poor_passphrases.count).to eq(1)
      end
    end

    context 'when the file is empty' do
      it 'returns 0' do
        expect(DayFour.new('spec/support/dummy_data/day_four/empty.txt').poor_passphrases.count).to eq(0)
      end
    end
  end
end
