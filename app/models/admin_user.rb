
class AdminUser < ActiveRecord::Base

  attr_accessible :name
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_readonly :sign_in_count, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_at, :last_sign_in_ip


  #  Validations
  #-----------------------------------------------
  validates :name, presence: true


  #  Devise
  #-----------------------------------------------
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable


  #  Avatar
  #-----------------------------------------------
  def avatar_url(size = 48)
    gravatar_id = Digest::MD5.hexdigest self.user.email.downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"
  end

end

