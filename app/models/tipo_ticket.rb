class TipoTicket < ActiveRecord::Base
  
  validates :tipo, :precio, :comentario, :presence => { :message => "es un campo obligatorio." }
  validates :tipo, :uniqueness => {:case_sensitive => false, :message => "debe ser único." }
  validates :precio, :numericality => {:greater_than => 0, :less_than => 1000, :message  => "no es un número." }
 end