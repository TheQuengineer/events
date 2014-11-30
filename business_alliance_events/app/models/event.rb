class Event < ActiveRecord::Base

  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end
end
