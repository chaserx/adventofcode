module Policy
  class Passphrase
    attr_reader :phrase

    def initialize(phrase)
      @phrase = phrase
    end

    def valid?
      !duplicates? && !contains_anagrams?
    end

    private

    # inspird by: https://stackoverflow.com/a/8922049/281699
    def duplicates?
      @phrase.split().group_by{ |e| e }.select{ |k, v| v.size > 1 }.any?
    end

    # NOTE(chaserx): part two adds an additional policy requirement around anagrams
    #   here, we're just sorting the characters of the word in the group_by block
    def contains_anagrams?
      @phrase.split().group_by{ |e| e.chars.sort }.select{ |k, v| v.size > 1 }.any?
    end
  end
end

class DayFour
  include Policy

  attr_reader :passphrase_table

  def initialize(file)
    @passphrase_table = Array.new
    populate_passphrase_table(file)
  end

  def good_passphrases
    @passphrase_table.select{ |phrase| Policy::Passphrase.new(phrase).valid? }
  end

  def poor_passphrases
    @passphrase_table.select{ |phrase| !Policy::Passphrase.new(phrase).valid? }
  end

  private

  def populate_passphrase_table(path)
    File.open(path) do |file|
      file.each_line do |line|
        @passphrase_table << line
      end
    end
  end
end

# puts DayFour.new("../data/day_four/input.txt").good_passphrases.count
