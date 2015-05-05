class Play < ActiveRecord::Base
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :generos
  has_and_belongs_to_many :funcions
  has_and_belongs_to_many :clasificacions
end