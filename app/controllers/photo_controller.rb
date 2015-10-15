class PhotoController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
  end

  def gauss
    upload('gauss')
  end

  def median
    upload('median')
  end

  def roberts
    upload('roberts')
  end

  def upload(f)
    file = params["webcam"].tempfile
    photo.update(file: file)

    ChangeImageService.call(photo, filter: f)

    render html: "<img class=\"wide\" src=\"#{photo.file.url}\">".html_safe, layout: false
  end

  private

    def photo
      @_photo ||= Photo.first || Photo.create
    end
end
