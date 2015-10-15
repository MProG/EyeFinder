class ChangeImageService
  def self.call model
    img = ChunkyPNG::Image.from_file(model.file.path)

    img = Filters::GaussFilter.new(img).filtered

    img.save(model.file.path)
  end
end
