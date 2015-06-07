class Feedback < ActiveRecord::Base
  validates_numericality_of :age, greater_than_or_equal_to: 5, :message => "debe ser mayor a 5 años"
  validates :age , :title, :message , :presence => { :message => "es un campo obligatorio." }
  validate :title , length:{maximum: 50}
  validate :message , length:{maximum: 500}
  
end
