# encoding: utf-8

class EventDate < ActiveRecord::Base

  attr_accessible :event_id
  attr_accessible :begin_at, :end_at, :weekday, :holiday


  #  Associations
  #-----------------------------------------------
  belongs_to :event


  #  Validations
  #-----------------------------------------------
  validates :event_id, presence: true
  validates :event, presence: true
  validates :begin_at, presence: true, on: :create
  validates :end_at, presence: true, on: :create

  validate :validate_term!


  #  Callbacks
  #-----------------------------------------------
  after_validation :set_weekday_and_holiday_flag


private


  #  Validation: 期間が正しいか判定
  #-----------------------------------------------
  def validate_term!
    unless DateTime.now.to_i < begin_at.to_i && begin_at.to_i < end_at.to_i
      self.errors.add :begin_at, '正しい期間を指定して下さい'
      false
    end
  end

  #  Callback: 期間が平日・休日を含んでいるか
  #-----------------------------------------------
  def set_weekday_and_holiday_flag
    wday = begin_at.wday
    duration = ((end_at.to_f - begin_at.to_f) / 1.day).floor
    self.weekday = (wday < 6)
    self.holiday = (wday + duration >= 6)
  end

end

