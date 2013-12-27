
class Event < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :user_id, :title

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

