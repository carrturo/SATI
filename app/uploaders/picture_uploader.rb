class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['post_picture']
  
  version :standard do
    process :resize_to_fill => [500, 500, :north]
  end
  
  version :thumbnail do
    resize_to_fill(300, 300)
  end

  version :home_page do
  	resize_to_fill(250, 250)
  end

end