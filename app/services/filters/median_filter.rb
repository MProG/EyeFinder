require 'RMagick'
include Magick

class Filters::MedianFilter
  def filtred
    img = ImageList.new("helena.jpg").first
    r, g, b = 0, 0, 0
    a = ImageList.new("helena.jpg").first
    img.rows.times do |y|
      img.columns.times do |x|
        r = to_8x(img.pixel_color(x, y).red)
        g = to_8x(img.pixel_color(x, y).green)
        b = to_8x(img.pixel_color(x, y).blue)
        pixel = Pixel.new(to_16x(r), to_16x(g), to_16x(b))
        img.pixel_color(x, y, pixel)
      end
    end
    a.display
    img.display
  end

  def to_8x(value)
    value & 255
  end

  def to_16x(value)
    value * 255
  end
end