
class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_readonly :sign_in_count, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_at, :last_sign_in_ip


  #  Associations
  #-----------------------------------------------
  has_one :creator


  #  Validations
  #-----------------------------------------------
  validates :creator, presence: true


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

