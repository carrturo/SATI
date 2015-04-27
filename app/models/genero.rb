class Genero < ActiveRecord::Base
  validates :nombre, :comentario, :presence => true
  validates :nombre, :uniqueness => true
end
