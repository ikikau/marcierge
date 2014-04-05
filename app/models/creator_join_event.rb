class CreatorJoinEvent < ActiveRecord::Base

  # has_many :event
  belongs_to :event
  belongs_to :creator
end