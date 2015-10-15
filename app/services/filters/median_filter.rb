class Filters::MedianFilter

  def filtred(img=false)
    if img
    png = ChunkyPNG::Image.new(img.width, img.height, ChunkyPNG::Color::TRANSPARENT)

    img.height.times do |y|
      img.width.times do |x|
        png[x,y] = get_midle(x,y, img)
      end
    end
    png
  end

  def get_midle(x,y, img)
    arr = []
    3.times do |x_off|
      3.times do |y_off|
        begin
          arr << img[x+1-x_off,y+1-y_off]
        rescue
          arr << 0
        end
      end
    end
    arr.sort[4]
  end
end