class Genero < ActiveRecord::Base
  validates :nombre, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :nombre, :uniqueness => { :case_sensitive => false, :message => "debe ser único." }
  validates_format_of :nombre, :with => /\A[a-zA-Z]+\z/, :message => "solo acepta letras."
end