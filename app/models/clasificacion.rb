class Clasificacion < ActiveRecord::Base
  validates :nombre, :edadMin, :edadMax, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates_numericality_of :edadMin, greater_than: 0, :message => "debe ser mayor a 0."
  validates_numericality_of :edadMax, less_than_or_equal_to: 100, :message => "debe ser menor o igual a 100"
  validates_numericality_of :edadMax, greater_than: :edadMin, :message => "debe ser mayor a edad mínima."
  validates :nombre, :uniqueness => {:case_sensitive => false, :message => "debe ser único." }
  has_and_belongs_to_many :plays
end
