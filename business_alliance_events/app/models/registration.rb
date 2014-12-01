class Registration < ActiveRecord::Base
  validates :name, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }
  belongs_to :event
end
