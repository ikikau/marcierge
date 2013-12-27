
class Event < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :creator_id, :title, :status, :tag_list

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

  belongs_to :creator, dependent: :destroy
  has_many :event_dates, dependent: :destroy

  accepts_nested_attributes_for :event_dates


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true
  validates :creator, presence: true


  #  Scope
  #-----------------------------------------------
  scope :private, -> { where status: :private }
  scope :public, -> { where status: :public }


  #  Kaminari
  #-----------------------------------------------
  paginates_per 10

end

