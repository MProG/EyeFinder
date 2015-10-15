class Filters::RobertsOperatorFilter

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
    arr = to_rgb(img[x,y])
    rez = {}

    arr.each_key do |el|
      begin
        tmp1 = (to_rgb(img[x,y])[:"#{el}"] - to_rgb(img[x+1, y+1])[:"#{el}"]).abs
        tmp2 = (to_rgb(img[x+1,y])[:"#{el}"] - to_rgb(img[x, y+1])[:"#{el}"]).abs
      rescue
        tmp1 = 0
        tmp2 = 0
      end
      rez[:"#{el}"] = Math.sqrt(tmp1**2+tmp2**2).to_i
    end
    ChunkyPNG::Color.rgb(rez[:currentRed], rez[:currentGreen], rez[:currentBlue])
  end

  def to_rgb(pixel)
    arr = {}
    arr[:currentRed] = ChunkyPNG::Color.r(pixel)
    arr[:currentGreen] = ChunkyPNG::Color.g(pixel)
    arr[:currentBlue] = ChunkyPNG::Color.b(pixel)
    arr    
  end

end