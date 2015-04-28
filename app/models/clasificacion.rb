class Clasificacion < ActiveRecord::Base
  validates :nombre, :edadMin, :edadMax, :comentario, :presence => true
  validates_numericality_of :edadMin, greater_than: 0
  validates_numericality_of :edadMax, less_than_or_equal_to: 100
  validates_numericality_of :edadMax, greater_than: :edadMin
  validates :nombre, :uniqueness => true
end
