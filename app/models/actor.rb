class Actor < ActiveRecord::Base
  has_and_belongs_to_many :plays
  has_and_belongs_to_many :destrezas
end
