class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  validates :title, presence: true, length: { minimum: 5 }
  validates :date, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :location, presence: true, length: { minimum: 5 }

  scope :past, -> { where('date < ?', DateTime.current.localtime) }
  scope :upcoming, -> { where('date > ?', DateTime.current.localtime) }
end
