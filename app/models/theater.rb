class Theater < ActiveRecord::Base
  validates :name, :address, :capacity, :presence => { :message => "es un campo obligatorio." }
  validates :name, :uniqueness => { :case_sensitive => false, :message => "debe ser único." }
  has_many :plays
end
