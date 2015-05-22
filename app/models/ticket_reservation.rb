require 'securerandom'
class TicketReservation < ActiveRecord::Base
  belongs_to :plays
  validates :email, :uniqueness => { :case_sensitive => false, :message => "debe ser único." }
  validates :name, :identity, :email, :presence => { :message => "es un campo obligatorio." }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :message => "no es válido."
  validates_format_of :identity, :with => /\d{4}-\d{4}-\d{5}/, :message => "no válido. Formato: XXXX-XXXX-XXXXX"
  
  
  before_create :generate_token, unless: :token?
  private
    def generate_token
      self.token = SecureRandom.hex(3)
  end
end
