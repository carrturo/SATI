class Play < ActiveRecord::Base
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :generos
  has_and_belongs_to_many :funcions
  has_and_belongs_to_many :clasificacions
  validates :title, :uniqueness => {:message => "debe ser único."}
  validates :title, :summary, :promotional_video, :duration, :end_date, :presence => { :message => "es un campo obligatorio." }
  validates_numericality_of :duration, greater_than: 0, :message => "debe ser mayor a 0."
  validates :end_date, date: { after: Proc.new { Time.now }, before: Proc.new { Time.now + 1.year }, :message => "no es válido. Debe ser una fecha más adelante."}
  validates :promotional_video, url: { :message => "no es válido. Formato: http://xxx.xxxxxx.xxx" }
end