class Actor < ActiveRecord::Base
  has_and_belongs_to_many :plays
  has_and_belongs_to_many :destrezas
  validates :email, :uniqueness => { :case_sensitive => false, :message => "debe ser único." }
  validates :facebook_profile, url: { :message => "no es válido. Formato: http://xxx.xxxxxx.xxx" }
  validates :name, :biography, :email, :presence => { :message => "es un campo obligatorio." }
  validates_format_of :name, :with => /[a-zA-Z\s(ñ)]+/, :message => "solo acepta letras."
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :message => "no es válido."
  validates_format_of :identity, :with => /\d{4}-\d{4}-\d{5}/, :message => "no válido. Formato: XXXX-XXXX-XXXXX"
end