class InfoGeneral < ActiveRecord::Base
  validates :nombre, :direccion, :email, :telefono, :presence => { :message => "es un campo obligatorio." }
  validates :nombre, length: {maximum: 50}
  validates :direccion, :email, length:{maximum: 50}
  validates :telefono , length:{maximum: 14}
  validates :fb, :tw, :youtube, :ig, url: { :message => "no es válido. Formato: http://xxx.xxxxxx.xxx" }, length:{maximum:50}
  validates_format_of :nombre, :with => /[a-zA-Z\s(ñ)]+/, :message => "solo acepta letras."
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :message => "formato: alguien@ejemplo.com"
  validates_format_of :telefono, :with => /\+\d{3}\s\d{4}\-\d{4}/, :message => "Formato: +504 XXXX-XXXX"
  
end
