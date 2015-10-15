class ChangeImageService
  def self.call(model, filter:)
    img = ChunkyPNG::Image.from_file(model.file.path)

    img = Filters::MedianFilter.new.filtred(img) if filter == 'median'
    img = Filters::GaussFilter.new(img).filtered if filter == 'gauss'
    img = Filters::RobertsOperatorFilter.new.filtred(img) if filter == 'roberts'

    img.save(model.file.path)
  end
end
