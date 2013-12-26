
class Admin < ActiveRecord::Base

  attr_accessible :name, :user_id


  #  Associations
  #-----------------------------------------------
  belongs_to :user


  #  Validations
  #-----------------------------------------------
  validates :user, presence: true
  validates :user_id, numericality: true
  validates :name, presence: true

end

