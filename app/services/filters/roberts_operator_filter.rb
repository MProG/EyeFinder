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
    begin
      tmp1 = (img[x,y] - img[x+1, y+1]).abs
      tmp2 = (img[x+1,y] - img[x, y+1]).abs
      Math.sqrt(tmp1**2+tmp2**2).to_i
    rescue
      0
    end
  end
end
