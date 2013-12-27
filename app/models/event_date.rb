
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
  validate :valid_event_date?


private


  #  Callback: Check if begin and end datetime is valid
  #-----------------------------------------------
  def valid_event_date?
    unless begin_at.to_i < end_at.to_i
      # TODO: change error message
      self.errors.add :end_at, 'invaild term'
      false
    end
  end

end

