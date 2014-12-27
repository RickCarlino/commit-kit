class Tracker < ActiveRecord::Base
  belongs_to :user
  has_many :events
end
