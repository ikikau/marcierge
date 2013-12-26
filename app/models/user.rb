
class User < ActiveRecord::Base

  attr_accessible :name, :profile, :avator_id
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_readonly :sign_in_count, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_at, :last_sign_in_ip


  #  Associations
  #-----------------------------------------------
  has_one :avator, class_name: '::Medium'
  has_many :events, dependent: :destroy


  #  Validations
  #-----------------------------------------------
  validates :name, presence: true


  #  Devise
  #-----------------------------------------------
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :confirmable

end

