
class Information < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :status, :title

  enumerize :status, in: [:private, :public], default: :private


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true


  #  Scope
  #-----------------------------------------------
  scope :private, -> { where status: :private }
  scope :public, -> { where status: :public }

end

