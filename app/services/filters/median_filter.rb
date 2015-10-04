require 'RMagick'
include Magick

class Filters::MedianFilter
  def filtred
    img = ImageList.new("helena.jpg").first
    img.rows.times do |y|
      img.columns.times do |x|
        R = to_8x(pixel_color(x, y).red)
        G = to_8x(pixel_color(x, y).red)
        B = to_8x(pixel_color(x, y).red)
        pixel = Pixel.new(to_16x(R), to_16x(G), to_16x(B))
        img.pixel_color(x, y, pixel)
      end
    end

  end

  def to_8x(value)
    value & 255
  end

  def to_16x(value)
    value * 255
  end
end