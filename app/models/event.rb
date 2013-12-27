
class Event < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :creator_id, :title, :status, :tag_list
  attr_accessible :event_dates_attributes

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

  accepts_nested_attributes_for :event_dates,
    allow_destroy: true,
    reject_if: ->(attr) {
      [
        attr['begin_at(1i)'],
        attr['begin_at(2i)'],
        attr['begin_at(3i)'],
        attr['begin_at(4i)'],
        attr['begin_at(5i)'],
        attr['end_at(1i)'],
        attr['end_at(2i)'],
        attr['end_at(3i)'],
        attr['end_at(4i)'],
        attr['end_at(5i)']
      ].any?(&:blank?)
    }


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

