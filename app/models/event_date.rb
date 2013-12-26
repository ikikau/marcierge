
class EventDate < ActiveRecord::Base

  attr_accessible :begin_at, :end_at, :event_id


  #  Associations
  #-----------------------------------------------
  belongs_to :event


  #  Validations
  #-----------------------------------------------
  validates :event, presence: true
  validates :event_id, numericality: true
  validates :begin_at, presence: true


  #  Callbacks
  #-----------------------------------------------
  before_save :check_event_date


private


  #  Callback: Check if begin and end datetime is valid
  #-----------------------------------------------
  def check_event_date
    unless begin_at < end_at
      # TODO: error message
      # self.errors.add :end_at, ''
      false
    end
  end

end

