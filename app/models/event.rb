class Event < ActiveRecord::Base
  attr_accessible :content, :creator_id, :status, :title
end
