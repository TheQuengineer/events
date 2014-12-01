class Event < ActiveRecord::Base
  validates :name, :location, presence: true
  validates :description, length: { minimum: 25 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :image_file_name, allow_blank: true, format: {
    with: /\.(png|jpg|gif)/,
    message: "must reference a GIF, JPG, or PNG image file name"
  }

  has_many :registrations, dependent: :destroy

  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end

  def seats_left
    capacity - registrations.size
  end

  def has_no_more_seats?
    seats_left.zero?
  end
end
