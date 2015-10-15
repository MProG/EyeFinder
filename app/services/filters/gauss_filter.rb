class Filters::MedianFilter
  attr_reader :image

  def initialize image
    @image = image
  end

  def filtered

  end

  private

    def cof
      [[0.003, 0.013, 0.022, 0.013, 0.003],
       [0.013, 0.059, 0.097, 0.059, 0.013],
       [0.022, 0.097, 0.159, 0.097, 0.022],
       [0.013, 0.059, 0.097, 0.059, 0.013],
       [0.003, 0.013, 0.022, 0.013, 0.003]]
    end
end
