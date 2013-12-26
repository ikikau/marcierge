
class Creator < ActiveRecord::Base

  attr_accessible :name, :profile, :user_id, :avator_id


  #  Associations
  #-----------------------------------------------
  belongs_to :user
  has_one :avator, class_name: '::Medium'
  has_many :events, dependent: :destroy


  #  Validations
  #-----------------------------------------------
  # validates :user, presence: true
  validates :name, presence: true

end

