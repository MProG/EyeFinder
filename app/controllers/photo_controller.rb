class PhotoController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :upload

  def show
  end

  def upload
    file = params["webcam"].tempfile

    render html: "<img src=\"#{file.path}\"/>".html_safe, layout: false
  end
end
