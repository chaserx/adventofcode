# typed: true
require 'sorbet-runtime'

class Rocket
  extend T::Sig

  attr_reader :input_file

  sig { void }
  def initialize
    @input_file = ARGV[0]
  end

  sig { void }
  def main
    module_weights = File.readlines(@input_file)
    puts part_two_fuel_requirements(module_weights)
  end

  # sig { returns(Integer) }
  # def part_one_fuel_requirements
  #   File.readlines(@input_file).inject(0) { |sum, line| sum + fuel_calculation(line.to_i) }
  # end

  sig { params(weights: Array).returns(Integer) }
  def part_two_fuel_requirements(weights)
    # weights.map{|mod| fuel_calculation(mod.to_i) }.reduce(0, :+)
    grand_total = 0
    weights.each do |weight|
      total = 0
      fuel = fuel_calculation(weight.to_i)

      while fuel > 0 do
        total += fuel
        fuel = fuel_calculation(fuel)
      end
      grand_total += total
    end

    grand_total
  end

  sig { params(weight: Integer).returns(Integer) }
  def fuel_calculation(weight)
    # divide by 3
    # round down
    # subtract 2
    ((weight / 3).floor) - 2
  end
end

Rocket.new.main
