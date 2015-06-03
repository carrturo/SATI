class Theater < ActiveRecord::Base
  validates :name, :address, :capacity, :presence => { :message => "es un campo obligatorio." }
  validates :name, :uniqueness => { :case_sensitive => false, :message => "debe ser único." }
  validates_numericality_of :capacity, greater_than: 0, :message => "debe ser mayor a 0."
  has_many :plays
end
