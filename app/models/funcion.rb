class Funcion < ActiveRecord::Base
  validates :hora, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :hora, :uniqueness => {:case_sensitive => false, :message => "debe ser único." }
end