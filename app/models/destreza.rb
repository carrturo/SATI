class Destreza < ActiveRecord::Base
  validates :nombre, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :nombre, :uniqueness => {:case_sensitive => false, :message => "debe ser único." }
  has_and_belongs_to_many :actors
end