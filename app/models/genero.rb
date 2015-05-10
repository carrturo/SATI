class Genero < ActiveRecord::Base
  validates :nombre, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :nombre, :uniqueness => { :case_sensitive => false, :message => "debe ser único." }
  validates_format_of :nombre, :with => /[a-zA-Z\s(ñ)]+/, :message => "solo acepta letras."
  has_and_belongs_to_many :plays
end