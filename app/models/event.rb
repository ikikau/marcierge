# encoding: utf-8

class Event < ActiveRecord::Base

  extend Enumerize

  attr_accessible :title, :content, :status, :location, :lead
  attr_accessible :tag_list
  attr_accessible :event_dates_attributes, :thumbnail_attributes
  attr_accessible :prefecture_id, :area_id

  enumerize :status, in: { private: 0, public: 1 }, default: :private, predicates: true, scope: true


  #  Associations
  #-----------------------------------------------
  acts_as_taggable

  belongs_to :creators, class_name: '::CreatorJoinEvent', dependent: :destroy
  belongs_to :thumbnail, class_name: '::Medium', dependent: :destroy
  belongs_to :prefecture, class_name: '::MasterPrefecture'
  belongs_to :area, class_name: '::MasterArea'
  has_many :event_dates, dependent: :destroy
  has_many :gallery_media, as: :imageable

  accepts_nested_attributes_for :event_dates,
    allow_destroy: true,
    reject_if: :reject_event_dates

  accepts_nested_attributes_for :thumbnail,
    allow_destroy: true


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true
  validates :status,
    presence: true,
    inclusion: { in: %w[private public] }
  validates :prefecture, presence: true
  validates :area, presence: true
  validates :location, presence: true


  #  Scope
  #-----------------------------------------------
  scope :public, -> { with_status :public }
  scope :private, -> { with_status :private }

  scope :holiday, -> { where id: EventDate.holiday.pluck(:event_id) }
  scope :weekday, -> { where id: EventDate.weekday.pluck(:event_id) }


  #  Kaminari
  #-----------------------------------------------
  paginates_per 10


private


  def reject_event_dates(attr)
    attr.except('id').values.any?(&:blank?)
  end

end

