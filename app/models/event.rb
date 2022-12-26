class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user

  scope :in_the_past, -> { where('date < ?', Time.now) }
  scope :in_the_future, -> { where('date >= ?', Time.now) }
end
