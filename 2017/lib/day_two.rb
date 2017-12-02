class DayTwo
  module Stats
    refine Array do
      def range
        self.max - self.min
      end
    end
  end

  using Stats

  attr_accessor :spreadsheet_path, :rows

  def initialize(spreadsheet_path)
    @rows = Array.new
    process_file(spreadsheet_path)
  end

  def checksum
    @rows.map(&:range).reduce(0, :+)
  end

  private

  def process_file(path)
    File.open(path) do |file|
      file.each_line do |line|
        @rows << line.split().map(&:to_i)
      end
    end
  end
end

# puts DayTwo.new("../data/day_two/spreadsheet.txt").checksum
