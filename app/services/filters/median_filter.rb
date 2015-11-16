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
  end

  def get_midle(x,y, img)
    rez = {}
    arr_r = []
    arr_g = []
    arr_b = []

    3.times do |x_off|
      3.times do |y_off|
        begin
          pixel = to_rgb(img[x+1-x_off,y+1-y_off])
          arr_r << (pixel[:R])
          arr_g << (pixel[:G])
          arr_b << (pixel[:B])
        rescue
          arr_r << 0
          arr_g << 0
          arr_b << 0
        end
      end
    end

    ChunkyPNG::Color.rgb(arr_r.sort[4], arr_g.sort[4], arr_b.sort[4])
  end

  def to_rgb(pixel)
    arr = {}
    arr[:R] = ChunkyPNG::Color.r(pixel)
    arr[:G] = ChunkyPNG::Color.g(pixel)
    arr[:B] = ChunkyPNG::Color.b(pixel)
    arr    
  end
end
