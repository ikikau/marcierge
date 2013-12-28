
class Tag < ActiveRecord::Base

  attr_accessible :name


  #  Validations
  #-----------------------------------------------
  validates :name, presence: true

end

