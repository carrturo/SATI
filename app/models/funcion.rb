class Funcion < ActiveRecord::Base
  validates :hora, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :hora, :uniqueness => {:case_sensitive => false, :message => "debe ser único." }
  validates :hora, date: { after: Proc.new { Time.now }, before: Proc.new { Time.now + 1.year }, :message => "no es válido. Debe ser una fecha más adelante. Máximo 1 año."}
  
  has_and_belongs_to_many :plays
  
end