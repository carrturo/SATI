class News < ActiveRecord::Base
  validates :title, :text, :presence => { :message => "es un campo obligatorio." }
  mount_uploader :picture, PictureUploader
end

