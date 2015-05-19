require 'securerandom'
class TicketReservation < ActiveRecord::Base
  belongs_to :plays
  before_create :generate_token, unless: :token?
  private
    def generate_token
      self.token = SecureRandom.hex(3)
  end
end
