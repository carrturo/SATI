class Genero < ActiveRecord::Base
  validates :nombre, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :nombre, :uniqueness => { :message => "debe ser único." }
  validates_format_of :nombre, :with =>  /\A[-a-z]+\Z/, :message => "solo acepta letras."
end
