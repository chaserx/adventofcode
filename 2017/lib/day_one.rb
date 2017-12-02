class DayOne
  class << self
    def reverse_captcha(input)
      sum = 0

      input_array = input.to_s.chars.map(&:to_i)
      input_array.each_with_index do |e, i|
        if i == input_array.size - 1
          if e == input_array[0]
            sum += e
          end
        end

        if e == input_array[i.next]
          sum += e
        end
      end

      sum
    end
  end
end
