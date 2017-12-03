class DayThree
  # NOTE(chaserx): stolen from stackoverflow: https://stackoverflow.com/a/398532/281699
  def spiral(xDim, yDim)
     sx = xDim / 2
     sy = yDim / 2

     cx = cy = 0
     direction = distance = 1

     yield(cx,cy)
     while(cx.abs <= sx || cy.abs <= sy)
        distance.times { cx += direction; yield(cx,cy) if(cx.abs <= sx && cy.abs <= sy); }
        distance.times { cy += direction; yield(cx,cy) if(cx.abs <= sx && cy.abs <= sy); }
        distance += 1
        direction *= -1
     end
  end

  # NOTE(chaserx): I think I get what's going on here...
  # The "ring/layer" of the sprial can determined by the sqrt of the number
  # because the spiral has a line of nested squares.
  #
  # see: https://www.reddit.com/r/adventofcode/comments/7h7ufl/2017_day_3_solutions/dqoxrb7/
  #
  # Solution help from: https://github.com/CoryMcDonald/advent_of_code_2017/blob/master/day3.rb
  #
  # looping here to spiral out towards our input number.
  #
  def steps(number)
    side = Math.sqrt(number).ceil

    i = 1
    spiral(side, side) { |x, y|
      return x.abs + y.abs if i == number
      i += 1
    }
  end
end

puts DayThree.new.steps(361527) #=> 326

