class Genero < ActiveRecord::Base
  validates :nombre, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :nombre, :uniqueness => {:case_sensitive => false, :message => "debe ser único." }, :format => {:with =>  /\A[-a-z]+\Z/, :message => "solo acepta letras."}
end
