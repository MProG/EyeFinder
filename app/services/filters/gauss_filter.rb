class Filters::GaussFilter
  attr_reader :array

  def initialize image
    @array = image
  end

  def filtered
    (2..array.dimension.width-3).each do |x|
      (2..array.dimension.height-3).each do |y|
        currentRed = calculate_color(:r, x, y)
        currentGreen = calculate_color(:g, x, y)
        currentBlue = calculate_color(:b, x, y)


        array[x,y] = ChunkyPNG::Color.rgb(currentRed.to_i, currentGreen.to_i, currentBlue.to_i)
      end
    end

    array
  end

  private

    def calculate_color(method, x, y)
      result = 0
      (-2..2).each do |i|
        (-2..2).each do |j|
          result += ChunkyPNG::Color.send(method, array[x+i, y+j]) * cof[2+i][2+j]
        end
      end
      result
    end

    def cof
      [[0.003, 0.013, 0.022, 0.013, 0.003],
       [0.013, 0.059, 0.097, 0.059, 0.013],
       [0.022, 0.097, 0.159, 0.097, 0.022],
       [0.013, 0.059, 0.097, 0.059, 0.013],
       [0.003, 0.013, 0.022, 0.013, 0.003]]
    end
end
