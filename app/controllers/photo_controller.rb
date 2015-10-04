class PhotoController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :upload

  def show
  end

  def upload
    file = params["webcam"].tempfile
    photo.update(file: file)

    render html: "<img src=\"#{photo.file.url}\">".html_safe, layout: false
  end

  private

    def photo
      @_photo ||= Photo.first || Photo.create
    end
end
