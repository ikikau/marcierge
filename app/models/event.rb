
class Event < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :creator_id, :title, :status

  enumerize :status,
    in: {
      private: 0,
      public: 1,
    },
    default: :private,
    predicates: true


  #  Associations
  #-----------------------------------------------
  acts_as_taggable
  acts_as_taggable_on :locations, :themes

  belongs_to :creator, dependent: :destroy
  has_many :event_dates, dependent: :destroy


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true
  validates :creator, presence: true


  #  Scope
  #-----------------------------------------------
  scope :private, -> { where status: :private }
  scope :public, -> { where status: :public }

end

