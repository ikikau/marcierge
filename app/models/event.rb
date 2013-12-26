
class Event < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :user_id, :status, :title

  enumerize :status, in: [:private, :public], default: :private


  #  Associations
  #-----------------------------------------------
  acts_as_taggable
  acts_as_taggable_on :locations, :themes

  belongs_to :user
  has_many :event_dates, dependent: :destroy


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true


  #  Scope
  #-----------------------------------------------
  scope :private, -> { where status: :private }
  scope :public, -> { where status: :public }

end

