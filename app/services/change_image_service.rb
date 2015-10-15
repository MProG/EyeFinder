class ChangeImageService
  def self.call model
    img = ChunkyPNG::Image.from_file(model.file.path)

    # (0..array.dimension.width-1).each do |x|
    #   (0..array.dimension.height-1).each do |y|
    #     currentRed = ChunkyPNG::Color.r(array[x,y])
    #     currentGreen = ChunkyPNG::Color.g(array[x,y])
    #     currentBlue = ChunkyPNG::Color.b(array[x,y])

    #     array[x,y] = ChunkyPNG::Color.rgb(0, 0, currentBlue)
    #   end
    # end
    img = Filters::GaussFilter.new(img).filtered

    img.save(model.file.path)
  end
end
