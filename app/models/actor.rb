class Actor < ActiveRecord::Base
  has_and_belongs_to_many :plays
  has_and_belongs_to_many :destrezas
  validates_format_of :name, :with => /[a-zA-Z\s(ñ)]+/, :message => "solo acepta letras."
  validates_format_of :id, :with => /\A\d{4}-\d{4}-\d{5}\z/, :message => "no válido. Utilice formato: XXXX-XXXX-XXXXX"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates :biography, :presence => true
end


