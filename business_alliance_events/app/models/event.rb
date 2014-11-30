class Event < ActiveRecord::Base
  validates :name, :location, presence: true
  validates :description, length: { minimum: 25 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :image_file_name, allow_blank: true, format: {
    with: /\.(png|jpg|gif)/,
    message: "must reference a GIF, JPG, or PNG image file name"
  }


  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end
end
