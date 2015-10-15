class ChangeImageService
  def self.call model
    img = ChunkyPNG::Image.from_file(model.file.path)

    img = Filters::MedianFilter.new.filtred(img)
    img = Filters::GaussFilter.new(img).filtered
    img = Filters::RobertsOperatorFilter.new.filtred(img)

    img.save(model.file.path)
  end
end
