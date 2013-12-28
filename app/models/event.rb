# encoding: utf-8

class Event < ActiveRecord::Base

  extend Enumerize

  attr_accessible :creator_id, :thumbnail_id, :prefecture_id, :area_id
  attr_accessible :title, :content, :status, :location
  attr_accessible :tag_list
  attr_accessible :event_dates_attributes, :thumbnail_attributes

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
  belongs_to :thumbnail, class_name: '::Medium', dependent: :destroy
  belongs_to :prefecture, class_name: '::MasterPrefecture'
  belongs_to :area, class_name: '::MasterArea'
  has_many :event_dates, dependent: :destroy

  accepts_nested_attributes_for :event_dates,
    allow_destroy: true,
    reject_if: :reject_event_dates

  accepts_nested_attributes_for :thumbnail,
    allow_destroy: true


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true
  validates :creator, presence: true
  validates :status,
    presence: true,
    inclusion: { in: %w[private public] }
  validates :prefecture_id, presence: true
  validates :prefecture, presence: true
  validates :area_id, presence: true
  validates :area, presence: true
  validates :location, presence: true
  validates :event_dates, presence: true


  #  Scope
  #-----------------------------------------------
  scope :private, -> { where status: :private }
  scope :public, -> { where status: :public }


  #  Kaminari
  #-----------------------------------------------
  paginates_per 10


private


  def reject_event_dates(attr)
    attr.except('id').values.any?(&:blank?)
  end

end

